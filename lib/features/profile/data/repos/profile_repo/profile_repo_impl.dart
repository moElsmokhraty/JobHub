import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/features/profile/data/repos/profile_repo/profile_repo.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_response.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  ProfileRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UpdateUserResponse>> updateUser(
      UpdateUserRequest model) async {
    try {
      var data = await _apiService.put(
        endpoint: APIConfig.updateUserEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(UpdateUserResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UpdateUserResponse>> getUser() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getUserEndpoint,
        token: token,
      );
      return Right(UpdateUserResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
