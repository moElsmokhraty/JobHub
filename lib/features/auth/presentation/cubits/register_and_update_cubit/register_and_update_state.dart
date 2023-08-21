part of 'register_and_update_cubit.dart';

@immutable
abstract class RegisterAndUpdateState {}

class RegisterAndUpdateInitial extends RegisterAndUpdateState {}

class RegisterLoading extends RegisterAndUpdateState {}

class RegisterSuccess extends RegisterAndUpdateState {}

class RegisterFailure extends RegisterAndUpdateState {
  final String errMessage;

  RegisterFailure(this.errMessage);
}

class UpdateUserLoading extends RegisterAndUpdateState {}

class UpdateUserSuccess extends RegisterAndUpdateState {
  final UserData userData;

  UpdateUserSuccess(this.userData);
}

class UpdateUserFailure extends RegisterAndUpdateState {
  final String errMessage;

  UpdateUserFailure(this.errMessage);
}

class ImageCropped extends RegisterAndUpdateState {}

class ImageUploadLoading extends RegisterAndUpdateState {}

class ImageUploadSuccess extends RegisterAndUpdateState {}

class ImageUploadFailure extends RegisterAndUpdateState {
  final String errMessage;

  ImageUploadFailure(this.errMessage);
}

class RegisterAndUpdateChangePasswordVisibility
    extends RegisterAndUpdateState {}

class PhoneChanged extends RegisterAndUpdateState {}

class LocationChanged extends RegisterAndUpdateState {}
