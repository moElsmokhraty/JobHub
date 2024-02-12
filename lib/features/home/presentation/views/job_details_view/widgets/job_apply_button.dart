import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/buttons/custom_outline_button.dart';

class JobApplyButton extends StatelessWidget {
  const JobApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: CustomOutlineButton(
          height: height * 0.065,
          width: width,
          text: 'Apply Now',
          onTap: () {},
          textAndBorderColor: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
        ),
      ),
    );
  }
}
