import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/widgets/custom_app_bar.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/all_jobs_view_body.dart';

class AllJobsView extends StatelessWidget {
  const AllJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            leading: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Icon(
                CupertinoIcons.arrow_left,
              ),
            ),
            title: 'Jobs',
          ),
        ),
        body: const AllJobsViewBody(),
      ),
    );
  }
}
