import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key, required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      width: width,
      height: height * 0.06,
      color: Color(kLightGrey.value),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            const Icon(Ionicons.phone_portrait_outline),
            const WidthSpacer(width: 15),
            ReusableText(
              text: phone,
              style: appStyle(18, Color(kDark.value), FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
