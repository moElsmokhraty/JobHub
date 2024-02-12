import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/data/models/login_models/login_request.dart';
import 'package:job_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.state,
    required this.cubit,
  });

  final LoginState state;
  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return state is LoginLoading
        ? Center(child: CircularProgressIndicator(color: Color(kOrange.value)))
        : CustomButton(
            text: 'Login',
            onTap: () async {
              if (cubit.key.currentState!.validate()) {
                cubit.login(
                  LoginRequest(
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                  ),
                );
              }
            },
          );
  }
}
