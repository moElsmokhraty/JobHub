import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/constants.dart';
import 'package:job_hub/core/widgets/app_style.dart';
import 'package:job_hub/core/widgets/reusable_text.dart';
import 'package:job_hub/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/page_one.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/page_three.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController onBoardController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    onBoardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardNotifier>(
      builder: (context, onBoardNotifier, child) => Stack(
        children: [
          PageView(
            physics: onBoardNotifier.isLastPage
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            onPageChanged: (currentIndex) =>
                onBoardNotifier.isLastPage = currentIndex == 2,
            controller: onBoardController,
            children: const [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
          Positioned(
            bottom: height * 0.08,
            left: 0,
            right: 0,
            child: onBoardNotifier.isLastPage
                ? const SizedBox.shrink()
                : Center(
                    child: SmoothPageIndicator(
                      controller: onBoardController,
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
            child: onBoardNotifier.isLastPage
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
                              onBoardController.nextPage(
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
                              onBoardController.jumpToPage(2);
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
      ),
    );
  }
}
