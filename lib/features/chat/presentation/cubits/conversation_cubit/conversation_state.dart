part of 'conversation_cubit.dart';

@immutable
abstract class ConversationState {}

class ConversationInitial extends ConversationState {}

class SendMessageLoading extends ConversationState {}

class SendMessageSuccess extends ConversationState {
  final SendMessageResponse response;

  SendMessageSuccess({required this.response});
}

class SendMessageFailure extends ConversationState {
  final String errMessage;

  SendMessageFailure({required this.errMessage});
}

class GetAllMessagesLoading extends ConversationState {}

class GetAllMessagesSuccess extends ConversationState {
  final GetAllMessagesResponse response;

  GetAllMessagesSuccess({required this.response});
}

class GetAllMessagesFailure extends ConversationState {
  final String errMessage;

  GetAllMessagesFailure({required this.errMessage});
}

class SocketConnected extends ConversationState {}

class SocketDisconnected extends ConversationState {}

class Typing extends ConversationState {}

class StopTyping extends ConversationState {}

class Online extends ConversationState {}
