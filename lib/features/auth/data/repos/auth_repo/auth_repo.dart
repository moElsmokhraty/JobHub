import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_request.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_response.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_request.dart';
import 'package:job_hub/features/auth/data/models/register_models/register_response.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/update_user_response.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequest model);

  Future<Either<Failure, RegisterResponse>> register(RegisterRequest model);

  Future<Either<Failure, ChangePasswordResponse>> changePassword(
      ChangePasswordRequest model);

  Future<Either<Failure, UpdateUserResponse>> updateUser(
      UpdateUserRequest model);

  Future<Either<Failure, UpdateUserResponse>> getUser();
}
