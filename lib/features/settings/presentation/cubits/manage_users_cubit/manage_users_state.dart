part of 'manage_users_cubit.dart';

@immutable
abstract class ManageUsersState {}

class ManageUsersInitial extends ManageUsersState {}

class GetAllUsersLoading extends ManageUsersState {}

class GetAllUsersSuccess extends ManageUsersState {
  final List<UserData> users;

  GetAllUsersSuccess(this.users);
}

class GetAllUsersFailure extends ManageUsersState {
  final String errMessage;

  GetAllUsersFailure(this.errMessage);
}

class DeleteUserLoading extends ManageUsersState {}

class DeleteUserSuccess extends ManageUsersState {}

class DeleteUserFailure extends ManageUsersState {
  final String errMessage;

  DeleteUserFailure(this.errMessage);
}
