import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._authRepoImpl) : super(ChangePasswordInitial());

  final AuthRepoImpl _authRepoImpl;

  Future<void> changePassword(ChangePasswordRequest request) async {
    emit(ChangePasswordLoading());
    var result = await _authRepoImpl.changePassword(request);
    result.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
    }, (response) {
      emit(ChangePasswordSuccess());
    });
  }
}
