import 'package:flutter/material.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_details_view_app_bar.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_details_view_body.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobsDetailsViewAppBar(
        company: job.company!,
        jobId: job.id!,
      ),
      body: JobDetailsViewBody(job: job),
    );
  }
}
