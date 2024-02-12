import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
        SystemNavigator.pop();
      },
      child: const SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Login',
          ),
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
