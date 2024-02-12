import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/widgets/complete_info_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/widgets/complete_info_view_body.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) async {
        GoRouter.of(context).pushReplacement(AppRoutes.kRegisterView);
      },
      child: const Scaffold(
        body: SafeArea(
          top: false,
          child: Scaffold(
            appBar: CompleteInfoAppBar(),
            body: CompleteInfoViewBody(),
          ),
        ),
      ),
    );
  }
}
