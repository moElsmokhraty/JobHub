import 'package:flutter/material.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/widgets/profile_view_body.dart';
import 'package:job_hub/features/profile/presentation/views/profile_view/widgets/profile_view_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: ProfileViewAppBar(),
        body: ProfileViewBody(),
      ),
    );
  }
}
