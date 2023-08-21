import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: height,
        width: width,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const HeightSpacer(size: 50),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Image.asset('assets/images/page2.png'),
            ),
            const HeightSpacer(size: 10),
            Text(
              'Stable yourself\n with your ability',
              textAlign: TextAlign.center,
              style: appStyle(
                30,
                Color(kLight.value),
                FontWeight.w500,
              ),
            ),
            const HeightSpacer(size: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                'We help you find your dream job according to your skills, location, and preference to build your career',
                textAlign: TextAlign.center,
                style: appStyle(
                  15,
                  Color(kLight.value),
                  FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
