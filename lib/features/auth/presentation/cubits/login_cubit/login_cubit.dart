import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_request.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_response.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/auth/data/models/change_password_models/change_password_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepoImpl) : super(LoginInitial());

  final AuthRepoImpl _authRepoImpl;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  IconData suffix = Icons.visibility_outlined;

  bool isObscure = true;

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await _authRepoImpl.login(request);
    result.fold(
      (failure) {
        emit(LoginFailure(failure.errMessage));
      },
      (response) {
        emit(LoginSuccess(response));
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
    await Future.wait(
      [
        CacheHelper.setData(key: 'token', value: ''),
        CacheHelper.setData(key: 'userId', value: null),
        CacheHelper.setData(key: 'userImage', value: null),
      ],
    );
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

  Future<void> getUser() async {
    emit(GetUserLoading());
    var result = await _authRepoImpl.getUser();
    result.fold((failure) {
      emit(GetUserFailure(failure.errMessage));
    }, (response) {
      emit(GetUserSuccess(response.userData!));
    });
  }

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }
}
