import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_response.dart';
import 'package:job_hub/features/chat/data/repos/conversation_repo/conversation_repo.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/send_message_request.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/get_all_messages_response.dart';

class ConversationRepoImpl implements ConversationRepo {
  final ApiService _apiService;

  ConversationRepoImpl(this._apiService);

  @override
  Future<Either<Failure, SendMessageResponse>> sendMessage(
      SendMessageRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.sendMessageEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(SendMessageResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetAllMessagesResponse>> getAllMessages({
    required String chatId,
    int pages = 1,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllMessagesEndpoint,
        token: token,
        query: {
          "chatId": chatId,
          "pages": pages,
        },
      );
      return Right(GetAllMessagesResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
