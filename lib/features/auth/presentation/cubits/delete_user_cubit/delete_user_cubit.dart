import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/delete_user_models/delete_user_request.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this._authRepoImpl) : super(DeleteUserInitial());

  final AuthRepoImpl _authRepoImpl;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  Future<void> deleteUser(DeleteUserRequest request) async {
    emit(DeleteUserLoading());
    var result = await _authRepoImpl.deleteUser(request);
    result.fold((failure) {
      emit(DeleteUserFailure(failure.errMessage));
    }, (response) {
      emit(DeleteUserSuccess());
    });
  }

  void reset() {
    passwordController.clear();
    key.currentState!.reset();
  }
}
