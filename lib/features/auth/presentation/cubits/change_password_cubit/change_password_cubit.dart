import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._authRepoImpl) : super(ChangePasswordInitial());

  final AuthRepoImpl _authRepoImpl;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  bool isCurrentPasswordObscure = true;

  bool isNewPasswordObscure = false;

  IconData currentSuffix = Icons.visibility_outlined;

  IconData newSuffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isCurrentPasswordObscure = !isCurrentPasswordObscure;
    isNewPasswordObscure = !isCurrentPasswordObscure;
    currentSuffix = isCurrentPasswordObscure
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    newSuffix = isNewPasswordObscure
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  Future<void> changePassword(ChangePasswordRequest request) async {
    emit(ChangePasswordLoading());
    var result = await _authRepoImpl.changePassword(request);
    result.fold((failure) {
      emit(ChangePasswordFailure(failure.errMessage));
    }, (response) {
      emit(ChangePasswordSuccess());
    });
  }

  void reset() {
    currentPasswordController.clear();
    newPasswordController.clear();
    key.currentState!.reset();
  }
}
