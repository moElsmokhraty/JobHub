part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserLoading extends ProfileState {}

class GetUserSuccess extends ProfileState {
  final UserData userData;

  GetUserSuccess(this.userData);
}

class GetUserFailure extends ProfileState {
  final String errMessage;

  GetUserFailure(this.errMessage);
}
