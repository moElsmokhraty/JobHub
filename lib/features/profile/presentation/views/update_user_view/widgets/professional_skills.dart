import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_fields/custom_text_field.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class ProfessionalSkills extends StatelessWidget {
  const ProfessionalSkills({
    super.key,
    required this.skills,
  });

  final List<TextEditingController> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: 'Professional Skills',
          style: appStyle(30, Color(kDark.value), FontWeight.bold),
        ),
        const HeightSpacer(size: 10),
        CustomTextField(
          keyboardType: TextInputType.text,
          hintText: 'First Skill',
          controller: skills[0],
        ),
        const HeightSpacer(size: 10),
        CustomTextField(
          keyboardType: TextInputType.text,
          hintText: 'Second Skill',
          controller: skills[1],
        ),
        const HeightSpacer(size: 10),
        CustomTextField(
          keyboardType: TextInputType.text,
          hintText: 'Third Skill',
          controller: skills[2],
        ),
        const HeightSpacer(size: 10),
        CustomTextField(
          keyboardType: TextInputType.text,
          hintText: 'Fourth Skill',
          controller: skills[3],
        ),
      ],
    );
  }
}
