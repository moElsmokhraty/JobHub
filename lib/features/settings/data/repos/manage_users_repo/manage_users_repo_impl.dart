import 'package:dio/dio.dart';
import 'manage_users_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/features/settings/data/models/get_all_users_response.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_response.dart';

class ManageUsersRepoImpl implements ManageUsersRepo {
  final ApiService _apiService;

  ManageUsersRepoImpl(this._apiService);

  @override
  Future<Either<Failure, DeleteUserResponse>> deleteUser(
      DeleteUserRequest request) async {
    try {
      var data = await _apiService.delete(
        data: request.toMap(),
        endpoint: APIConfig.deleteUserEndpoint,
        token: token,
      );
      return Right(DeleteUserResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetAllUsersResponse>> getAllUsers() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllUsersEndpoint,
        token: token,
      );
      return Right(GetAllUsersResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
