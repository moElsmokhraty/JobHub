import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';

class Skills extends StatelessWidget {
  const Skills({super.key, required this.skills});

  final List<dynamic> skills;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: ReusableText(
              text: 'Skills',
              style: appStyle(20, Color(kDark.value), FontWeight.w600),
            ),
          ),
          const HeightSpacer(size: 3),
          SizedBox(
            height: height * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: width,
                      height: height * 0.06,
                      color: Color(kLight.value),
                      child: ReusableText(
                        text: skills[index] ?? '',
                        style:
                            appStyle(16, Color(kDark.value), FontWeight.normal),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
