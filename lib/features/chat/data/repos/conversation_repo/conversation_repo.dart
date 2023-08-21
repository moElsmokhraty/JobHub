import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_response.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/get_all_messages_response.dart';

abstract class ConversationRepo {
  Future<Either<Failure, SendMessageResponse>> sendMessage(
      SendMessageRequest model);

  Future<Either<Failure, GetAllMessagesResponse>> getAllMessages(
      {required String chatId, int pages = 1});
}
