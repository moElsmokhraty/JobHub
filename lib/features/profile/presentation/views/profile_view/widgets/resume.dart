import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/launch_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class Resume extends StatelessWidget {
  const Resume({super.key, required this.resumeUrl, this.username});

  final String? username;
  final String? resumeUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height * 0.12,
          color: Color(kLightGrey.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12.w),
                width: 60.w,
                height: 70.h,
                color: Color(kLight.value),
                child: IconButton(
                  onPressed: resumeUrl == null
                      ? null
                      : () {
                          launchMyUrl(context, resumeUrl!);
                        },
                  icon: const Icon(
                    Icons.file_present_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: resumeUrl == null
                        ? 'Upload your resume'
                        : '$username\'s Resume',
                    style: appStyle(18, Color(kDark.value), FontWeight.w500),
                  ),
                  ReusableText(
                    text: 'JobHub Resume',
                    style:
                        appStyle(16, Color(kDarkGrey.value), FontWeight.w500),
                  ),
                ],
              ),
              const WidthSpacer(width: 1),
            ],
          ),
        ),
      ],
    );
  }
}
