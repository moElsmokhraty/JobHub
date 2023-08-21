import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/job_tile.dart';

class SlidableJobTile extends StatelessWidget {
  const SlidableJobTile(
      {super.key, required this.job, required this.onDismissed});

  final Job job;
  final void Function() onDismissed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () async {
            onDismissed();
          },
        ),
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16, bottom: 12),
              decoration: BoxDecoration(
                color: Color(kOrange.value),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    size: 30,
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Delete',
                    style: appStyle(
                      15,
                      Color(kLight.value),
                      FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      child: JobTile(job: job),
    );
  }
}
