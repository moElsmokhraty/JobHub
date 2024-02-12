import 'widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: HomeAppBar(),
        body: HomeViewBody(),
      ),
    );
  }
}
