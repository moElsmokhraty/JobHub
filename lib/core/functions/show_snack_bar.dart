import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';

void showCustomSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content, textAlign: TextAlign.center),
      width: width * 0.8,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
