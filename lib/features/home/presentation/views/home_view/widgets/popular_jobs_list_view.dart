import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/utils/cache_helper.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/routes_config/app_routes.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/text_styles/reusable_text.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/core/widgets/states/loading_state/vertical_shimmer.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/popular_job_item.dart';

class PopularJobsListView extends StatelessWidget {
  const PopularJobsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) async {
        if (state is GetAllJobsFailure &&
            (state).errMessage == 'Invalid Token') {
          showCustomSnackBar(context, 'Session Expired');
          GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
          await CacheHelper.removeData(key: 'token');
        }
      },
      builder: (context, state) {
        if (state is GetAllJobsFailure) {
          return Center(
            child: ReusableText(
              text: 'Error ${state.errMessage}',
              style: appStyle(
                14,
                Color(kDark.value),
                FontWeight.w500,
              ),
            ),
          );
        } else if (state is GetAllJobsSuccess) {
          if (state.jobs.isEmpty) {
            return const CustomErrorWidget(
              message: 'Error No Jobs Found',
            );
          } else {
            List<Job> popularJobs = [state.jobs[0], state.jobs[1]];
            return SizedBox(
              height: height * 0.25,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return PopularJobItem(job: popularJobs[index]);
                },
              ),
            );
          }
        } else {
          return const Center(
            child: VerticalShimmer(),
          );
        }
      },
    );
  }
}
