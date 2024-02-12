import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/widgets/register_button.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/widgets/personal_details.dart';
import 'package:job_hub/features/auth/presentation/views/complete_info_view/widgets/professional_skills.dart';

class CompleteInfoViewBody extends StatelessWidget {
  const CompleteInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          cubit.reset();
          BlocProvider.of<MediaCubit>(context).imageUrl = null;
          showCustomSnackBar(context, 'Account created successfully');
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
        } else if (state is RegisterFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) => Form(
        key: cubit.completeInfoKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          children: [
            PersonalDetails(cubit: cubit),
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
              ],
            ),
            const HeightSpacer(size: 20),
            RegisterButton(cubit: cubit, state: state),
          ],
        ),
      ),
    );
  }
}
