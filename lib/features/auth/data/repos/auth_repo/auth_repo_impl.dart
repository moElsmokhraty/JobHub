import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_request.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_response.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_response.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_response.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_response.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.loginEndpoint,
        data: model.toMap(),
      );
      return Right(LoginResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.registerEndpoint,
        data: model.toMap(),
      );
      return Right(RegisterResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ChangePasswordResponse>> changePassword(
      ChangePasswordRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.changePasswordEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(ChangePasswordResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UpdateUserResponse>> updateUser(
      UpdateUserRequest model) async {
    try {
      var data = await _apiService.post(
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
