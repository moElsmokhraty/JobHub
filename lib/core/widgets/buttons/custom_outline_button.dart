import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
    required this.color1,
    this.color2,
  });

  final double height;
  final double width;
  final String text;
  final void Function() onTap;
  final Color color1;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color2,
          border: Border.all(
            color: color1,
            width: 1,
          ),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(
              16,
              color1,
              FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
