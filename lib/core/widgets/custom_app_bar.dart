import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    required this.leading,
    this.actions,
  });

  final String? title;
  final Widget leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(kLight.value),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: leading,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        text: title ?? '',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.w600,
        ),
      ),
    );
  }
}
