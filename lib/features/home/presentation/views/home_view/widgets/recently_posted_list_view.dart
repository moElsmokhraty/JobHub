import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/states/loading_state/vertical_shimmer.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/home/presentation/views/home_view/widgets/recently_posted_item.dart';

class RecentlyPostedListView extends StatelessWidget {
  const RecentlyPostedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        if (state is GetAllJobsFailure) {
          return Center(
            child: Text(
              'Error ${state.errMessage}',
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
            return SizedBox(
              height: height * 0.25,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return RecentlyPostedItem(job: state.jobs.first);
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
