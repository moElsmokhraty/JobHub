import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_response.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/get_all_messages_response.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._conversationRepoImpl) : super(ConversationInitial());

  final ConversationRepoImpl _conversationRepoImpl;

  ScrollController scrollController = ScrollController();

  late final socket_io.Socket? socket;

  List<String> onlineUsers = [];

  int pages = 1;

  TextEditingController msgController = TextEditingController();

  void setOnlineUsers(List<String> users) {
    onlineUsers = users;
    emit(Online());
  }

  bool isTyping = false;

  void connect() {
    socket = socket_io.io('http://10.0.2.2:5001', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();
    socket!.on('connect', (_) {
      socket!.emit('online', userId);

      socket!.on('typing', (status) {
        isTyping = true;
        emit(Typing());
      });

      socket!.on('stop typing', (status) {
        isTyping = false;
        emit(StopTyping());
      });

      socket!.on(
          'message received',
          (newMessageReceived) =>
              sendStopTypingEvent(newMessageReceived['chatId']));
    });
    emit(SocketConnected());
  }

  void disconnect(String chatId) {
    socket!.emit('offline', chatId);
    emit(SocketDisconnected());
  }

  void sendTypingEvent(String chatId) {
    socket!.emit('typing', chatId);
  }

  void joinChat(String chatId) {
    socket!.emit('join chat', chatId);
  }

  void sendStopTypingEvent(String chatId) {
    socket!.emit('stop typing', chatId);
  }

  Future<void> sendMessage(SendMessageRequest model) async {
    emit(SendMessageLoading());
    var result = await _conversationRepoImpl.sendMessage(model);
    result.fold((failure) {
      emit(SendMessageFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(SendMessageSuccess(response: response));
    });
  }

  Future<void> getAllMessages({required String chatId}) async {
    emit(GetAllMessagesLoading());
    var result = await _conversationRepoImpl.getAllMessages(
      chatId: chatId,
      pages: pages,
    );
    result.fold((failure) {
      emit(GetAllMessagesFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(GetAllMessagesSuccess(response: response));
    });
  }
}
