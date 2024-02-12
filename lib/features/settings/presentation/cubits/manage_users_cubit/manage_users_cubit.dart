import 'package:bloc/bloc.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/settings/data/repos/manage_users_repo/manage_users_repo_impl.dart';
import 'package:meta/meta.dart';

part 'manage_users_state.dart';

class ManageUsersCubit extends Cubit<ManageUsersState> {
  ManageUsersCubit(this._manageUsersRepoImpl) : super(ManageUsersInitial());

  final ManageUsersRepoImpl _manageUsersRepoImpl;

  Future<void> getAllUsers() async {
    emit(GetAllUsersLoading());
    var result = await _manageUsersRepoImpl.getAllUsers();
    result.fold((failure) {
      emit(GetAllUsersFailure(failure.errMessage));
    }, (response) {
      emit(GetAllUsersSuccess(response.users ?? []));
    });
  }

  Future<void> deleteUser(DeleteUserRequest request) async {
    emit(DeleteUserLoading());
    var result = await _manageUsersRepoImpl.deleteUser(request);
    result.fold((failure) {
      emit(DeleteUserFailure(failure.errMessage));
    }, (response) {
      emit(DeleteUserSuccess());
    });
  }
}
