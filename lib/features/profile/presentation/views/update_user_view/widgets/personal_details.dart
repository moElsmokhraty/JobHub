import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/edit_resume_button.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/phone_text_field.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/country_text_field.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key, required this.cubit});

  final UpdateUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: 'PersonalDetails',
          style: appStyle(30, Color(kDark.value), FontWeight.bold),
        ),
        const HeightSpacer(size: 10),
        PhoneTextField(cubit: cubit),
        const HeightSpacer(size: 10),
        CountryTextField(cubit: cubit),
        const HeightSpacer(size: 10),
        const EditResumeButton(),
      ],
    );
  }
}
