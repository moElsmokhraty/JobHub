import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:job_hub/features/profile/presentation/cubits/update_user_cubit/update_user_cubit.dart';

class CountryTextField extends StatelessWidget {
  const CountryTextField({super.key, required this.cubit});

  final UpdateUserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          useSafeArea: true,
          showPhoneCode: true,
          context: context,
          onSelect: (country) {
            cubit.changeCountry(country);
          },
        );
      },
    );
  }
}
