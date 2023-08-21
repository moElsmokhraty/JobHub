part of 'update_user_cubit.dart';

@immutable
abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {
  final UserData userData;

  UpdateUserSuccess(this.userData);
}

class UpdateUserFailure extends UpdateUserState {
  final String errMessage;

  UpdateUserFailure(this.errMessage);
}

class GetUserLoading extends UpdateUserState {}

class GetUserSuccess extends UpdateUserState {
  final UserData userData;

  GetUserSuccess(this.userData);
}

class GetUserFailure extends UpdateUserState {
  final String errMessage;

  GetUserFailure(this.errMessage);
}

class ImageCropped extends UpdateUserState {}

class ImageUploadLoading extends UpdateUserState {}

class ImageUploadSuccess extends UpdateUserState {}

class ImageUploadFailure extends UpdateUserState {
  final String errMessage;

  ImageUploadFailure(this.errMessage);
}

class ChangePasswordVisibility extends UpdateUserState {}

class PhoneChanged extends UpdateUserState {}

class LocationChanged extends UpdateUserState {}
