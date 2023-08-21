import '../text_styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.w500,
        ),
      ),
    );
  }
}
