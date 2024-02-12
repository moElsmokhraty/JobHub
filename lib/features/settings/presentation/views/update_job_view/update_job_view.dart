import 'package:flutter/material.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/update_job_app_bar.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/update_job_view_body.dart';

class UpdateJobView extends StatelessWidget {
  const UpdateJobView({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpdateJobAppBar(),
      body: UpdateJobViewBody(jobId: job.id!),
    );
  }
}
