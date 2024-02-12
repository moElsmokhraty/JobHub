import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/job_tile.dart';
import 'package:job_hub/features/settings/presentation/views/manage_jobs_view/widgets/delete_job_alert_dialog.dart';

class SlidableJobTile extends StatelessWidget {
  const SlidableJobTile({
    super.key,
    required this.job,
    required this.cubit,
  });

  final Job job;
  final JobsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: false,
      startActionPane: ActionPane(
        dragDismissible: false,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            autoClose: false,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            backgroundColor: Color(kOrange.value),
            label: 'Delete',
            icon: Icons.delete_outline_outlined,
            onPressed: (context) {
              showAdaptiveDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return DeleteJobAlertDialog(jobId: job.id!, cubit: cubit);
                },
              );
            },
          ),
          SlidableAction(
            autoClose: false,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            backgroundColor: Color(kLightBlue.value),
            label: 'Update',
            icon: Icons.edit_outlined,
            onPressed: (context) {
              GoRouter.of(context)
                  .pushReplacement(AppRoutes.kUpdateJobView, extra: job);
            },
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        child: JobTile(job: job),
      ),
    );
  }
}
