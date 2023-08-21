part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class GetAllChatsLoading extends ChatState {}

class GetAllChatsSuccess extends ChatState {
  final GetAllChatsResponse response;

  GetAllChatsSuccess({required this.response});
}

class GetAllChatsError extends ChatState {
  final String errMessage;

  GetAllChatsError({required this.errMessage});
}

class ApplyForJobLoading extends ChatState {}

class ApplyForJobSuccess extends ChatState {
  final AccessChatResponse response;

  ApplyForJobSuccess({required this.response});
}

class ApplyForJobError extends ChatState {
  final String errMessage;

  ApplyForJobError({required this.errMessage});
}
