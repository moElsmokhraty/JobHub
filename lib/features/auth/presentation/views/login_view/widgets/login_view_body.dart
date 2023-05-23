import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/custom_btn.dart';
import 'package:job_hub/core/widgets/custom_textfield.dart';
import 'package:job_hub/core/widgets/height_spacer.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';
import 'package:job_hub/features/auth/presentation/providers/login_provider.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/register_view.dart';
import 'package:provider/provider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  void dispose() {
    // TODO: implement dispose
    LoginNotifier().emailController.dispose();
    LoginNotifier().passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) => Form(
        key: loginNotifier.key,
        child: Container(
          color: Color(kLight.value),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              const HeightSpacer(size: 50),
              ReusableText(
                text: 'Welcome Back!',
                style: appStyle(
                  30,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: 'Fill the details to login to your account.',
                style: appStyle(
                  16,
                  Color(kDarkGrey.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 40),
              CustomTextField(
                controller: LoginNotifier().emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                validate: (emailController) {
                  return loginNotifier.validateEmail(emailController!);
                },
              ),
              const HeightSpacer(size: 20),
              CustomTextField(
                controller: LoginNotifier().passwordController,
                hintText: 'Password',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.lock_outlined),
                obsecure: loginNotifier.isObsecure,
                suffixIcon: GestureDetector(
                  onTap: () {
                    loginNotifier.changeObsecure();
                  },
                  child: Icon(
                    loginNotifier.isObsecure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(kDark.value),
                  ),
                ),
                validate: (passwordController) {
                  return loginNotifier.validatePassword(passwordController!);
                },
              ),
              const HeightSpacer(size: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const RegisterView());
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
              ),
              const HeightSpacer(size: 20),
              CustomButton(
                text: 'Login',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
