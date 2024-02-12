import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/core/widgets/states/loading_state/vertical_shimmer.dart';
import 'package:job_hub/core/widgets/states/empty_list_state.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/job_tile.dart';

class AllJobsViewBody extends StatelessWidget {
  const AllJobsViewBody({super.key});

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
            return const EmptyListWidget(
              text: 'Error No Jobs Found',
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JobTile(job: state.jobs[index]),
                );
              },
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
