import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(kLight.value),
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: leading,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        text: title ?? '',
        style: appStyle(
          18,
          Color(kDark.value),
          FontWeight.w600,
        ),
      ),
    );
  }
}
