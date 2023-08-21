import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_request.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_response.dart';
import 'package:job_hub/features/chat/data/models/chat_models/get_all_chats_response.dart';

abstract class ChatRepo {
  Future<Either<Failure, AccessChatResponse>> applyForJob(
      AccessChatRequest model);

  Future<Either<Failure, GetAllChatsResponse>> getAllChats();
}
