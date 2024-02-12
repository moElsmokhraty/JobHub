import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/settings/data/models/get_all_users_response.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_response.dart';

abstract class ManageUsersRepo {
  Future<Either<Failure, GetAllUsersResponse>> getAllUsers();

  Future<Either<Failure, DeleteUserResponse>> deleteUser(
      DeleteUserRequest request);
}
