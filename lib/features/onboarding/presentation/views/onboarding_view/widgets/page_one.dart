import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/height_spacer.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: height,
        width: width,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const HeightSpacer(size: 60),
            Image.asset('assets/images/page1.png'),
            const HeightSpacer(size: 30),
            ReusableText(
              text: 'Find Your Dream Job',
              style: appStyle(
                35,
                Colors.white,
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
