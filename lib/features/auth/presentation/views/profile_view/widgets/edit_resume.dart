import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/spacers/width_spacer.dart';

class EditResume extends StatelessWidget {
  const EditResume({super.key});

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
                child: const Icon(
                  Icons.file_present_outlined,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: 'Resume from JobHub',
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
        Positioned(
          top: 2.h,
          right: 5.w,
          child: GestureDetector(
            onTap: () {},
            child: ReusableText(
              text: 'Edit',
              style: appStyle(16, Color(kOrange.value), FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
