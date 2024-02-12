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

class PhoneChanged extends UpdateUserState {}

class LocationChanged extends UpdateUserState {}
