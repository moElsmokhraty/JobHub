import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignOutAllButton extends StatelessWidget {
  const SignOutAllButton({
    super.key,
  });

  //final OnBoardNotifier onBoardNotifier;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: GestureDetector(
          onTap: () {
            //drawerNotifier.changeIndex(0);
            //onBoardNotifier.isLastPage = false;
            //Get.to(() => const OnboardingView());
          },
          child: ReusableText(
            text: 'Sign Out from All Devices',
            style: appStyle(16, Color(kOrange.value), FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
