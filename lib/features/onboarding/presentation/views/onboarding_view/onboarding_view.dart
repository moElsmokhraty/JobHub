import 'package:flutter/material.dart';
import 'package:job_hub/features/onboarding/presentation/views/onboarding_view/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        body: OnboardingViewBody(),
      ),
    );
  }
}
