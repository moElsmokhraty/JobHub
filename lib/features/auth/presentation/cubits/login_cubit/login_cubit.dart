import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_request.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_response.dart';

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

  void changePasswordVisibility() {
    isObscure = !isObscure;
    suffix =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }
}
