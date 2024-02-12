import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_hub/core/functions/extract_country_code.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key, required this.cubit});

  final UpdateUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: cubit.phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(kDarkGrey.value),
          ),
        ),
        labelText: 'Phone Number',
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.phone_iphone_outlined),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.number.isEmpty) {
          return 'Phone number is required';
        } else {
          return null;
        }
      },
      initialCountryCode: extractCountryCode(
          '+${cubit.codeController.text}${cubit.phoneController.text}')[2],
      onChanged: (phone) {
        cubit.phoneController.text = phone.number;
      },
      onCountryChanged: (country) {
        cubit.codeController.text = country.dialCode;
      },
    );
  }
}
