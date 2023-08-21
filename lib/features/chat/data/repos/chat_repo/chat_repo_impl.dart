import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/features/chat/data/repos/chat_repo/chat_repo.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_request.dart';
import 'package:job_hub/features/chat/data/models/chat_models/access_chat_response.dart';
import 'package:job_hub/features/chat/data/models/chat_models/get_all_chats_response.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService _apiService;

  ChatRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AccessChatResponse>> applyForJob(
      AccessChatRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.accessChatEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(AccessChatResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetAllChatsResponse>> getAllChats() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllChatsEndpoint,
        token: token,
      );
      return Right(GetAllChatsResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
