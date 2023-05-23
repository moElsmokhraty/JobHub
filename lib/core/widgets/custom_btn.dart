import 'package:flutter/material.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap, this.color});

  final String text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(kOrange.value),
        width: width,
        height: height * 0.065,
        child: Center(
          child: Text(
            text,
            style: appStyle(
              16,
              color ?? Color(kLight.value),
              FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
