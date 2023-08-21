import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/personal_details.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/professional_skills.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/update_user_app_bar.dart';
import 'package:job_hub/features/auth/presentation/views/update_user_view/widgets/register_and_update_button.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_and_update_cubit/register_and_update_cubit.dart';

class UpdateUserViewBody extends StatelessWidget {
  const UpdateUserViewBody({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    RegisterAndUpdateCubit cubit = BlocProvider.of(context);
    return BlocConsumer<RegisterAndUpdateCubit, RegisterAndUpdateState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showCustomSnackBar(context, 'Account created successfully!');
        } else if (state is RegisterFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        } else if (state is UpdateUserSuccess) {
          showCustomSnackBar(context, 'Account updated successfully!');
        } else if (state is UpdateUserFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.registerAndUpdateKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              const UpdateUserAppBar(),
              const HeightSpacer(size: 30),
              PersonalDetails(
                cubit: cubit,
                data: data,
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: 'Professional Skills',
                style: appStyle(30, Color(kDark.value), FontWeight.bold),
              ),
              const HeightSpacer(size: 10),
              ProfessionalSkills(
                skills: [
                  cubit.firstSkillController,
                  cubit.secondSkillController,
                  cubit.thirdSkillController,
                  cubit.fourthSkillController,
                  cubit.fifthSkillController,
                ],
              ),
              const HeightSpacer(size: 20),
              state is RegisterLoading || state is UpdateUserLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(kOrange.value),
                      ),
                    )
                  : RegisterAndUpdateButton(
                      cubit: cubit,
                      registering: data['registering'],
                    ),
            ],
          ),
        );
      },
    );
  }
}
