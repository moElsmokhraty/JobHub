import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:job_hub/features/chat/data/models/conversation_models/message.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo_impl.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_response.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/get_all_messages_response.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._conversationRepoImpl) : super(ConversationInitial());

  final ConversationRepoImpl _conversationRepoImpl;

  ScrollController scrollController = ScrollController();

  late final socket_io.Socket socket;

  int pages = 1;

  bool isOnline = false;

  bool isTyping = false;

  TextEditingController msgController = TextEditingController();

  List<Message> messages = [];

  void handleScroll() {
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (messages.length >= 12) {
            getAllMessages(chatId: messages[0].chat!.id!, pages: pages++);
          }
        }
      }
    });
  }

  void connect(String chatId) {
    socket = socket_io.io('http://10.0.2.2:5001', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
    socket.on('connect', (_) {
      print('connected to socket Iooooooooooooooo');
      socket.emit('online', userId!);
      socket.emit('join chat', userId!);

      socket.on('typing', (room) {
        isTyping = true;
        emit(Typing());
      });

      socket.on('stop typing', (room) {
        isTyping = false;
        emit(StopTyping());
      });

      socket.on('message received', (newMessageReceived) {
        sendStopTypingEvent(chatId);
        Message newMessage = Message.fromJson(newMessageReceived);
        if (newMessage.sender!.id != userId!) {
          messages.insert(0, newMessage);
          emit(MessageReceived());
        }
      });

      socket.on('online', (status) {
        isOnline = true;
        emit(Online());
      });

      socket.on('offline', (status) {
        isOnline = false;
        emit(Offline());
      });
    });
    emit(SocketConnected());
  }

  void disconnect(String userId) {
    socket.emit('offline', userId);
    socket.once('offline', (_) {
      socket.disconnect().close().clearListeners();
    });
    emit(SocketDisconnected());
  }

  void joinChat(String room) {
    socket.emit('join chat', room);
  }

  void sendTypingEvent(String status) {
    socket.emit('typing', status);
  }

  void sendStopTypingEvent(String status) {
    socket.emit('stop typing', status);
  }

  Future<void> sendMessage(SendMessageRequest model) async {
    var result = await _conversationRepoImpl.sendMessage(model);
    result.fold((failure) {
      emit(SendMessageFailure(errMessage: failure.errMessage));
    }, (response) {
      socket.emit('message sent', [model.chatId, model.toJson()]);
      socket.emit('stop typing', model.chatId);
      msgController.clear();
      messages.insert(0, response.message!);
      emit(SendMessageSuccess(response: response));
    });
  }

  Future<void> getAllMessages({
    required String chatId,
    int pages = 1,
  }) async {
    emit(GetAllMessagesLoading());
    var result = await _conversationRepoImpl.getAllMessages(
      chatId: chatId,
      pages: pages,
    );
    result.fold((failure) {
      emit(GetAllMessagesFailure(errMessage: failure.errMessage));
    }, (response) {
      messages = response.messages!;
      emit(GetAllMessagesSuccess(response: response));
    });
  }
}
