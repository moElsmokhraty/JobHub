import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/buttons/custom_outline_button.dart';

class JobSummary extends StatelessWidget {
  const JobSummary({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.25,
      color: Color(kLightGrey.value),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(job.imageUrl!),
            ),
            const HeightSpacer(size: 10),
            ReusableText(
              text: job.title!,
              style: appStyle(
                22,
                Color(kDark.value),
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(size: 5),
            ReusableText(
              text: job.location!,
              style: appStyle(
                16,
                Color(kDarkGrey.value),
                FontWeight.normal,
              ),
            ),
            const HeightSpacer(size: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineButton(
                  height: height * 0.04,
                  width: width * 0.27,
                  text: job.workHours!,
                  onTap: () {},
                  textAndBorderColor: Color(kOrange.value),
                  backgroundColor: Color(kLight.value),
                ),
                SizedBox(
                  width: width * 0.42,
                  child: ReusableText(
                    text: job.salary!,
                    style: appStyle(
                      18,
                      Color(kDark.value),
                      FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
