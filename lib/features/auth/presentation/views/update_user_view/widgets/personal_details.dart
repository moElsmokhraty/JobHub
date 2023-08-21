import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/auth/presentation/cubits/register_and_update_cubit/register_and_update_cubit.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
    required this.cubit,
    required this.data,
  });

  final RegisterAndUpdateCubit cubit;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (data['registering']) {
          Navigator.pop(context);
        } else {
          return true;
        }
        return false;
      },
      child: Column(
        children: [
          // IntlPhoneField(
          //   controller: cubit.phoneController,
          //   decoration: const InputDecoration(
          //     labelText: 'Phone Number',
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(),
          //     ),
          //   ),
          //   initialCountryCode: 'EG',
          //   initialValue: data['registering'] ? null : data['phone'],
          //   autovalidateMode: AutovalidateMode.always,
          //   onChanged: (phoneNumber) {
          //     cubit.changePhone(phoneNumber);
          //   },
          // ),
          const HeightSpacer(size: 10),
          TextFormField(
            controller: cubit.locationController.text.isEmpty
                ? TextEditingController(
                    text: data['registering'] ? '' : data['userData']['location'],
                  )
                : cubit.locationController,
            //initialValue: data['registering'] ? '' : data['userData']['location'],
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
      ),
    );
  }
}
