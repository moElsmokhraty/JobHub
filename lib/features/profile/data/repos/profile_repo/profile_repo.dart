import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_request.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/update_user_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UpdateUserResponse>> updateUser(
      UpdateUserRequest model);

  Future<Either<Failure, UpdateUserResponse>> getUser();
}
