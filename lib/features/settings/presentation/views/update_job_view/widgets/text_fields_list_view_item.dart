import 'package:flutter/material.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_fields/custom_text_field.dart';

class TextFieldsListViewItem extends StatelessWidget {
  const TextFieldsListViewItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const HeightSpacer(size: 10),
        CustomTextField(
          controller: controller,
          hintText: hintText,
          keyboardType: TextInputType.text,
          validate: (value) {
            if (value!.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}
