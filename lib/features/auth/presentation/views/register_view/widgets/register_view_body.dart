import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/text_fields/email_text_field.dart';
import 'package:job_hub/core/widgets/text_fields/password_text_field.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/widgets/login_text.dart';
import 'package:job_hub/features/auth/presentation/views/register_view/widgets/name_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of(context);
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: cubit.registerKey,
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
                NameTextField(usernameController: cubit.usernameController),
                const HeightSpacer(size: 20),
                EmailTextField(emailController: cubit.emailController),
                const HeightSpacer(size: 20),
                PasswordTextField(
                  passwordController: cubit.passwordController,
                  changePasswordVisibility: cubit.changePasswordVisibility,
                  isObscure: cubit.isObscure,
                ),
                const HeightSpacer(size: 20),
                const LoginText(),
                const HeightSpacer(size: 20),
                CustomButton(
                  text: 'Complete Info',
                  onTap: () async {
                    if (cubit.registerKey.currentState!.validate()) {
                      GoRouter.of(context).push(
                        AppRoutes.kUpdateUserView,
                        extra: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
