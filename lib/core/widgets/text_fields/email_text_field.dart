import 'package:flutter/material.dart';
import 'package:job_hub/core/functions/validate_email.dart';
import 'package:job_hub/core/widgets/text_fields/custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      validate: (emailController) {
        return validateEmail(emailController!);
      },
    );
  }
}
