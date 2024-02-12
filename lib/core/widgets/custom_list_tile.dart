import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      hoverColor: Color(kLightGrey.value),
      title: ReusableText(
        text: title,
        style: appStyle(
          18,
          Color(kDark.value),
          FontWeight.w500,
        ),
      ),
      subtitle: ReusableText(
        text: subtitle,
        style: appStyle(
          16,
          Color(kDarkGrey.value),
          FontWeight.w400,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: Color(kDarkGrey.value),
        size: 24.sp,
      ),
    );
  }
}
