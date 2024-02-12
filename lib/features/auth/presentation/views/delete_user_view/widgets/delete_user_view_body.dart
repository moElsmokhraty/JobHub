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
import 'package:job_hub/core/widgets/text_fields/password_text_field.dart';
import 'package:job_hub/features/auth/presentation/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/delete_user_view/widgets/delete_user_button.dart';

class DeleteUserViewBody extends StatelessWidget {
  const DeleteUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteUserCubit cubit = BlocProvider.of(context);
    return BlocConsumer<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) async {
        if (state is DeleteUserSuccess) {
          showCustomSnackBar(context, 'Account deleted successfully!');
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
          await removeCache();
          cubit.reset();
        } else if (state is DeleteUserFailure) {
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
                  text: 'Delete Account!',
                  style: appStyle(
                    24,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                const HeightSpacer(size: 10),
                ReusableText(
                  text: 'Fill the details to delete your account.',
                  style: appStyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.w500,
                  ),
                ),
                const HeightSpacer(size: 40),
                PasswordTextField(
                  passwordController: cubit.passwordController,
                  changePasswordVisibility: cubit.changePasswordVisibility,
                  isObscure: cubit.isObscure,
                ),
                const HeightSpacer(size: 20),
                DeleteUserButton(cubit: cubit, state: state),
              ],
            ),
          ),
        );
      },
    );
  }
}
