import 'package:flutter/material.dart';
import 'package:job_hub/core/functions/validate_text.dart';
import 'package:job_hub/core/widgets/text_fields/custom_text_field.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.usernameController});

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: usernameController,
      hintText: 'Username',
      keyboardType: TextInputType.text,
      prefixIcon: const Icon(Icons.person_outlined),
      validate: (nameController) {
        return validateName('name', nameController!);
      },
    );
  }
}
