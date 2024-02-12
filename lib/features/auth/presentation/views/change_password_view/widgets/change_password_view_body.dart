import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/text_fields/password_text_field.dart';
import 'package:job_hub/features/auth/presentation/cubits/change_password_cubit/change_password_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/change_password_view/widgets/change_password_button.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordCubit cubit = BlocProvider.of(context);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          showCustomSnackBar(context, 'Password changed successfully!');
          GoRouter.of(context).pushReplacement(AppRoutes.kSettingsView);
          cubit.reset();
        } else if (state is ChangePasswordFailure) {
          showCustomSnackBar(context, state.errMessage);
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
                  text: 'Change Password!',
                  style: appStyle(
                    24,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                const HeightSpacer(size: 10),
                ReusableText(
                  text: 'Fill the details to change your password.',
                  style: appStyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.w500,
                  ),
                ),
                const HeightSpacer(size: 40),
                PasswordTextField(
                  hint: 'Current Password',
                  passwordController: cubit.currentPasswordController,
                  changePasswordVisibility: cubit.changePasswordVisibility,
                  isObscure: cubit.isCurrentPasswordObscure,
                ),
                const HeightSpacer(size: 20),
                PasswordTextField(
                  hint: 'New Password',
                  passwordController: cubit.newPasswordController,
                  changePasswordVisibility: cubit.changePasswordVisibility,
                  isObscure: cubit.isNewPasswordObscure,
                ),
                const HeightSpacer(size: 20),
                ChangePasswordButton(cubit: cubit, state: state),
              ],
            ),
          ),
        );
      },
    );
  }
}
