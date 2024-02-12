import 'email.dart';
import 'resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/widgets/skills.dart';
import 'package:job_hub/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/widgets/phone_number.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/widgets/personal_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          showCustomSnackBar(context, state.errMessage);
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
              Resume(
                username: state.userData.username,
                resumeUrl: state.userData.resumeUrl,
              ),
              const HeightSpacer(size: 20),
              Email(email: state.userData.email!),
              const HeightSpacer(size: 20),
              PhoneNumber(phone: state.userData.phone!),
              const HeightSpacer(size: 20),
              Skills(skills: state.userData.skills!),
            ],
          );
        } else if (state is GetUserFailure) {
          return const Center(child: Text('Error'));
        } else {
          return Center(
            child: CircularProgressIndicator(color: Color(kOrange.value)),
          );
        }
      },
    );
  }
}
