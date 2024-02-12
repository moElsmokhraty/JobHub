import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/onboarding/presentation/cubits/onboarding_cubit/onboarding_cubit.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/first_page.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/third_page.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/second_page.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingCubit cubit = BlocProvider.of(context);
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Stack(
          children: [
            PageView(
              physics: cubit.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              onPageChanged: (currentIndex) =>
                  cubit.isLastPage = currentIndex == 2,
              controller: cubit.onBoardController,
              children: const [
                FirstPage(),
                SecondPage(),
                ThirdPage(),
              ],
            ),
            Positioned(
              bottom: height * 0.08,
              left: 0,
              right: 0,
              child: cubit.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                        controller: cubit.onBoardController,
                        count: 3,
                        effect: WormEffect(
                          dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 10,
                          activeDotColor: Color(kLight.value),
                        ),
                      ),
                    ),
            ),
            Positioned(
              child: cubit.isLastPage
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                cubit.onBoardController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: ReusableText(
                                text: 'Next',
                                style: appStyle(
                                  16,
                                  Color(kLight.value),
                                  FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                cubit.onBoardController.jumpToPage(2);
                              },
                              child: ReusableText(
                                text: 'Skip',
                                style: appStyle(
                                  16,
                                  Color(kLight.value),
                                  FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
