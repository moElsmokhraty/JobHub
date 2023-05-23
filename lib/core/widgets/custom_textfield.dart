import 'package:flutter/material.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    this.obsecure,
    required this.hintText,
    this.suffixIcon,
    required this.controller,
    this.validate,
    this.prefixIcon,
  });

  final TextInputType keyboardType;
  final bool? obsecure;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obsecure ?? false,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: appStyle(
            14,
            Color(kDarkGrey.value),
            FontWeight.w500,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Color(kDarkGrey.value),
              width: 0.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.5,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
