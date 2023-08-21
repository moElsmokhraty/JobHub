import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_details_view_app_bar.dart';
import 'package:job_hub/features/home/presentation/views/job_details_view/widgets/job_details_view_body.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: JobsDetailsViewAppBar(company: job.company!),
      ),
      body: JobDetailsViewBody(job: job),
    );
  }
}
