import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/auth/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key, required this.cubit});

  final UpdateUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntlPhoneField(
          controller: cubit.phoneController,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          initialCountryCode: 'EG',
          autovalidateMode: AutovalidateMode.always,
          onChanged: (phoneNumber) {
            cubit.changePhone(phoneNumber);
          },
        ),
        const HeightSpacer(size: 10),
        TextFormField(
          controller: cubit.locationController,
          readOnly: true,
          decoration: InputDecoration(
            fillColor: Color(kLightGrey.value),
            hoverColor: Color(kLightGrey.value),
            focusColor: Color(kLightGrey.value),
            labelText: 'Location',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
            suffix: Text(
              cubit.emoji.text,
              style: const TextStyle(fontFamily: 'EmojiOne'),
            ),
          ),
          onTap: () {
            showCountryPicker(
              showPhoneCode: false,
              context: context,
              onSelect: (country) {
                cubit.changeCountry(country);
              },
            );
          },
        ),
      ],
    );
  }
}
