import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';
import 'package:job_hub/core/widgets/width_spacer.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.index,
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final Color color;
  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, bottom: 20.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const WidthSpacer(width: 12),
            ReusableText(
              text: text,
              style: appStyle(
                12,
                color,
                FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
