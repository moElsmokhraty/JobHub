part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

class ChangePasswordLoading extends LoginState {}

class ChangePasswordSuccess extends LoginState {}

class ChangePasswordFailure extends LoginState {
  final String errMessage;

  ChangePasswordFailure(this.errMessage);
}

class GetUserLoading extends LoginState {}

class GetUserSuccess extends LoginState {
  final UserData userData;

  GetUserSuccess(this.userData);
}

class GetUserFailure extends LoginState {
  final String errMessage;

  GetUserFailure(this.errMessage);
}

class LoginChangePasswordVisibility extends LoginState {}
