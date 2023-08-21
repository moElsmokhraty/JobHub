import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class Email extends StatelessWidget {
  const Email({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      width: width,
      height: height * 0.06,
      color: Color(kLightGrey.value),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ReusableText(
          text: email,
          style: appStyle(18, Color(kDark.value), FontWeight.w600),
        ),
      ),
    );
  }
}
