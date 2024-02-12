import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/home/presentation/views/all_jobs_view/widgets/job_tile.dart';
import 'package:job_hub/features/home/presentation/views/search_view/widgets/search_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        if (state is SearchJobsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchJobsFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: appStyle(14, Color(kDark.value), FontWeight.w500),
            ),
          );
        } else if (state is SearchJobsSuccess) {
          if (state.searchResults.isEmpty) {
            return const SearchWidget(text: 'No jobs found');
          } else {
            return ListView.builder(
              itemCount: state.searchResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JobTile(
                    job: Job.fromMap(state.searchResults[index]),
                  ),
                );
              },
            );
          }
        } else {
          return const SearchWidget(text: 'Start searching for jobs');
        }
      },
    );
  }
}
