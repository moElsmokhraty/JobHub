import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/custom_btn.dart';
import 'package:job_hub/core/widgets/custom_textfield.dart';
import 'package:job_hub/core/widgets/height_spacer.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';
import 'package:job_hub/features/auth/presentation/providers/register_provider.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/login_view.dart';
import 'package:provider/provider.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  void dispose() {
    // TODO: implement dispose
    RegisterNotifier().nameController;
    RegisterNotifier().emailController;
    RegisterNotifier().passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterNotifier>(
      builder: (context, registerNotifier, child) => Form(
        key: registerNotifier.key,
        child: Container(
          color: Color(kLight.value),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              const HeightSpacer(size: 50),
              ReusableText(
                text: 'Welcome to Job-Hub!',
                style: appStyle(
                  30,
                  Color(kDark.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: 'Fill the details to create new account.',
                style: appStyle(
                  16,
                  Color(kDarkGrey.value),
                  FontWeight.w600,
                ),
              ),
              const HeightSpacer(size: 40),
              CustomTextField(
                controller: RegisterNotifier().nameController,
                hintText: 'Name',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outlined),
                validate: (nameController) {
                  return registerNotifier.validateName(nameController!);
                },
              ),
              const HeightSpacer(size: 20),
              CustomTextField(
                controller: RegisterNotifier().emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                validate: (emailController) {
                  return registerNotifier.validateEmail(emailController!);
                },
              ),
              const HeightSpacer(size: 20),
              CustomTextField(
                controller: RegisterNotifier().passwordController,
                hintText: 'Password',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.lock_outlined),
                obsecure: registerNotifier.isObsecure,
                suffixIcon: GestureDetector(
                  onTap: () {
                    registerNotifier.changeObsecure();
                  },
                  child: Icon(
                    registerNotifier.isObsecure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(kDark.value),
                  ),
                ),
                validate: (passwordController) {
                  return registerNotifier.validatePassword(passwordController!);
                },
              ),
              const HeightSpacer(size: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const LoginView());
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
              ),
              const HeightSpacer(size: 20),
              CustomButton(
                text: 'Register',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
