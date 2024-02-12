import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
        GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
      },
      child: const SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Register',
            leading: SizedBox.shrink(),
          ),
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
