import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/handle_cache.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/text_fields/email_text_field.dart';
import 'package:job_hub/core/widgets/text_fields/password_text_field.dart';
import 'package:job_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/widgets/login_button.dart';
import 'package:job_hub/features/auth/presentation/views/login_view/widgets/create_account_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.kMainView);
          showCustomSnackBar(context, 'Login Successful');
          await setCache(state.response);
        } else if (state is LoginFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.key,
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
                    24,
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
                    FontWeight.w500,
                  ),
                ),
                const HeightSpacer(size: 40),
                EmailTextField(emailController: cubit.emailController),
                const HeightSpacer(size: 20),
                PasswordTextField(
                  passwordController: cubit.passwordController,
                  changePasswordVisibility: cubit.changePasswordVisibility,
                  isObscure: cubit.isObscure,
                ),
                const HeightSpacer(size: 20),
                CreateAccountText(cubit: cubit),
                const HeightSpacer(size: 20),
                LoginButton(state: state, cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
