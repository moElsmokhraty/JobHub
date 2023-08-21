import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

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
    this.init,
  });

  final TextInputType keyboardType;
  final bool? obsecure;
  final String hintText;
  final String? init;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      initialValue: init,
      keyboardType: keyboardType,
      obscureText: obsecure ?? false,
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        errorStyle: appStyle(
          12,
          Color(kDark.value),
          FontWeight.w500,
        ),
        filled: true,
        fillColor: Color(kLightGrey.value),
        hintText: hintText,
        hintStyle: appStyle(
          14,
          Color(kDarkGrey.value),
          FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Color(kOrange.value),
            width: 0.25,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Color(kOrange.value),
            width: 0.75,
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
            width: 0,
          ),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
