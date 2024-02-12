import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/presentation/views/delete_user_view/widgets/delete_user_view_body.dart';

class DeleteUserView extends StatelessWidget {
  const DeleteUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Delete Account',
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
          body: const DeleteUserViewBody()),
    );
  }
}
