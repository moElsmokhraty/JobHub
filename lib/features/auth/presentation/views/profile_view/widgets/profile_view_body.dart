import 'email.dart';
import 'edit_resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/auth/presentation/views/profile_view/widgets/skills.dart';
import 'package:job_hub/features/auth/presentation/views/profile_view/widgets/phone_number.dart';
import 'package:job_hub/features/auth/presentation/views/profile_view/widgets/personal_info.dart';
import 'package:job_hub/features/auth/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) async {
        if (state is UpdateUserFailure) {
          showCustomSnackBar(context, state.errMessage);
        } else if (state is UpdateUserSuccess) {
          showCustomSnackBar(context, 'User updated successfully');
          await BlocProvider.of<UpdateUserCubit>(context).getUser();
        }
      },
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            children: [
              PersonalInfo(userData: state.userData),
              const HeightSpacer(size: 20),
              const EditResume(),
              const HeightSpacer(size: 20),
              Email(email: state.userData.email!),
              const HeightSpacer(size: 20),
              PhoneNumber(phone: state.userData.phone!),
              const HeightSpacer(size: 20),
              Skills(skills: state.userData.skills!),
            ],
          );
        } else if (state is GetUserFailure) {
          return CustomErrorWidget(message: 'Error ${state.errMessage}');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
