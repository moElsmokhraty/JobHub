import 'package:flutter/material.dart';
import 'widgets/create_job_app_bar.dart';
import 'widgets/create_job_view_body.dart';

class CreateJobView extends StatelessWidget {
  const CreateJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Scaffold(
        appBar: CreateJobAppBar(),
        body: CreateJobViewBody(),
      ),
    );
  }
}
