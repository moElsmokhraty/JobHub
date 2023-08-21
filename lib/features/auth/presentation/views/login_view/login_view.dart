import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const SafeArea(
        top: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Login',
            ),
          ),
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
