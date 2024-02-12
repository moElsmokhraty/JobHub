import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/core/widgets/buttons/custom_outline_button.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: height,
        width: width,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset(
              height: height * 0.6,
              width: width,
              'assets/images/page3.png',
              fit: BoxFit.fitWidth,
            ),
            const HeightSpacer(size: 20),
            ReusableText(
              text: 'Find Your Dream Job',
              style: appStyle(
                32,
                Color(kLight.value),
                FontWeight.w500,
              ),
            ),
            const HeightSpacer(size: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(
                'We help you find your dream job according to your skills, location, and preference to build your career',
                textAlign: TextAlign.center,
                style: appStyle(
                  18,
                  Color(kLight.value),
                  FontWeight.normal,
                ),
              ),
            ),
            const HeightSpacer(size: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineButton(
                  height: height * 0.065,
                  width: width * 0.4,
                  text: 'Login',
                  textAndBorderColor: Color(kLight.value),
                  onTap: () async {
                    GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
                    firstTime = false;
                    await CacheHelper.setData(key: 'firstTime', value: false);
                  },
                ),
                CustomOutlineButton(
                  height: height * 0.065,
                  width: width * 0.4,
                  text: 'Register',
                  backgroundColor: Colors.white,
                  textAndBorderColor: Color(kLightBlue.value),
                  onTap: () async {
                    GoRouter.of(context)
                        .pushReplacement(AppRoutes.kRegisterView);
                    firstTime = false;
                    await CacheHelper.setData(key: 'firstTime', value: false);
                  },
                ),
              ],
            ),
            const HeightSpacer(size: 35),
          ],
        ),
      ),
    );
  }
}
