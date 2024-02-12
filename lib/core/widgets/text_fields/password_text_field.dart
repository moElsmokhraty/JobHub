import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/validate_password.dart';
import 'package:job_hub/core/widgets/text_fields/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.changePasswordVisibility,
    required this.isObscure,
    this.hint,
  });

  final TextEditingController passwordController;
  final VoidCallback changePasswordVisibility;
  final bool isObscure;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: passwordController,
      hintText: hint ?? 'Password',
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(Icons.lock_outlined),
      obsecure: isObscure,
      suffixIcon: GestureDetector(
        onTap: () {
          changePasswordVisibility();
        },
        child: Icon(
          isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: Color(kDark.value),
        ),
      ),
      validate: (passwordController) {
        return validatePassword(passwordController!);
      },
    );
  }
}
