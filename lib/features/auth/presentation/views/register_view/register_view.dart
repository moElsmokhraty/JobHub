import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            title: 'Register',
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        body: const RegisterViewBody(),
      ),
    );
  }
}
