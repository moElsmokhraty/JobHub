import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/presentation/views/change_password_view/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
        GoRouter.of(context).pushReplacement(AppRoutes.kSettingsView);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Change Password',
          leading: GestureDetector(
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kSettingsView);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: const SafeArea(
          child: ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
