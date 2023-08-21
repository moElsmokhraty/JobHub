import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
        },
        child: Text(
          'Already have account? login!',
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
