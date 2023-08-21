import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/home_view_body.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const HomeAppBar(),
      ),
      body: const SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
