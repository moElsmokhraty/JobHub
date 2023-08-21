import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/update_user_view_body.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (data['registering']) {
          GoRouter.of(context).pushReplacement(AppRoutes.kRegisterView);
        } else {
          return true;
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: UpdateUserViewBody(
            data: data,
          ),
        ),
      ),
    );
  }
}
