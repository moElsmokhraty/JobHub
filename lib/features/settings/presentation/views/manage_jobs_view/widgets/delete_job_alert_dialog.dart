import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/settings/data/models/delete_job_models/delete_job_request.dart';

class DeleteJobAlertDialog extends StatelessWidget {
  const DeleteJobAlertDialog(
      {super.key, required this.jobId, required this.cubit});

  final String jobId;
  final JobsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ReusableText(
        text: 'Delete Job',
        style: appStyle(
          16,
          Color(kDark.value),
          FontWeight.bold,
        ),
      ),
      content: ReusableText(
        text: 'Are you sure you want to delete this job?',
        style: appStyle(
          12,
          Color(kDarkGrey.value),
          FontWeight.w500,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: ReusableText(
            text: 'Cancel',
            style: appStyle(
              12,
              Color(kLightBlue.value),
              FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await cubit
                .deleteJob(DeleteJobRequest(jobId: jobId))
                .then((value) async {
              GoRouter.of(context).pop();
              await cubit.getAllJobs();
            });
          },
          child: ReusableText(
            text: 'Delete',
            style: appStyle(
              12,
              Color(kLightBlue.value),
              FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
