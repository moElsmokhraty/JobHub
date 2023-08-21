import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () async {
          GoRouter.of(context).pushReplacement(AppRoutes.kRegisterView);
        },
        child: Text(
          'Don\'t have account? register!',
          style: appStyle(
            16,
            Color(kDark.value),
            FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
