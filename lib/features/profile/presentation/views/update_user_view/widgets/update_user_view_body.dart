import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/widgets/personal_details.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/widgets/professional_skills.dart';
import 'package:job_hub/features/profile/presentation/views/update_user_view/widgets/update_user_button.dart';

class UpdateUserViewBody extends StatelessWidget {
  const UpdateUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateUserCubit cubit = BlocProvider.of(context);
    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) async {
        if (state is UpdateUserSuccess) {
          GoRouter.of(context).pop();
          showCustomSnackBar(context, 'Account updated successfully!');
          BlocProvider.of<MediaCubit>(context).imageUrl = null;
          BlocProvider.of<MediaCubit>(context).resumeUrl = null;
          await BlocProvider.of<ProfileCubit>(context).getUser();
          await CacheHelper.removeData(key: 'userImage');
          await CacheHelper.setData(
              key: 'userImage', value: state.userData.imageUrl!);
        } else if (state is UpdateUserFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.updateUserKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            children: [
              PersonalDetails(cubit: cubit),
              const HeightSpacer(size: 10),
              ProfessionalSkills(
                skills: [
                  cubit.firstSkillController,
                  cubit.secondSkillController,
                  cubit.thirdSkillController,
                  cubit.fourthSkillController,
                ],
              ),
              const HeightSpacer(size: 15),
              UpdateUserButton(cubit: cubit, state: state),
            ],
          ),
        );
      },
    );
  }
}
