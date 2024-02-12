import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key, required this.cubit});

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: 'PersonalDetails',
          style: appStyle(30, Color(kDark.value), FontWeight.bold),
        ),
        const HeightSpacer(size: 10),
        IntlPhoneField(
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
          initialCountryCode: "EG",
          onChanged: (phone) {
            cubit.phoneController.text = phone.number;
          },
          onCountryChanged: (country) {
            cubit.codeController.text = country.dialCode;
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
