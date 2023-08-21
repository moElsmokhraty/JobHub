import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import '../../../../../../core/widgets/text_styles/app_style.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text,
          style: appStyle(
            20,
            Color(kDark.value),
            FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
            text: 'View all',
            style: appStyle(
              18,
              Color(kOrange.value),
              FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
