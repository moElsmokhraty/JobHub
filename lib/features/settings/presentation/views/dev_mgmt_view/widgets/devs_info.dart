import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/buttons/custom_outline_button.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/settings/data/models/dev_data.dart';

class DevsInfo extends StatelessWidget {
  const DevsInfo({super.key, required this.devData});

  final DevData devData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: devData.platform ?? 'ios',
          style: appStyle(22, Color(kDark.value), FontWeight.bold),
        ),
        ReusableText(
          text: devData.device ?? 'Iphone 12 pro',
          style: appStyle(22, Color(kDark.value), FontWeight.bold),
        ),
        const HeightSpacer(size: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: devData.date ?? 'today',
                  style: appStyle(16, Color(kDarkGrey.value), FontWeight.w400),
                ),
                ReusableText(
                  text: devData.ipAddress ?? '192.168.1.1',
                  style: appStyle(16, Color(kDarkGrey.value), FontWeight.w400),
                ),
              ],
            ),
            CustomOutlineButton(
              height: height * 0.05,
              width: width * 0.3,
              text: 'Sign Out',
              onTap: () {},
              color1: Color(kOrange.value),
            ),
          ],
        )
      ],
    );
  }
}
