import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:job_hub/core/widgets/states/error_state.dart';
import 'package:job_hub/core/widgets/states/empty_list_state.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/manage_jobs_view/widgets/slidable_job_tile.dart';

class ManageJobsViewBody extends StatelessWidget {
  const ManageJobsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    JobsCubit cubit = BlocProvider.of(context);
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {
        if (state is DeleteJobFailure) {
          showCustomSnackBar(context, 'Error: ${state.errMessage}');
        } else if (state is DeleteJobSuccess) {
          showCustomSnackBar(context, 'Job deleted successfully');
        }
      },
      builder: (context, state) {
        if (state is GetAllJobsSuccess) {
          if (state.jobs.isEmpty) {
            return const EmptyListWidget(text: 'No Jobs Found');
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: state.jobs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlidableJobTile(
                    job: state.jobs[index],
                    cubit: cubit,
                  ),
                );
              },
            );
          }
        } else if (state is GetAllJobsFailure) {
          return CustomErrorWidget(message: 'Error: ${state.errMessage}');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
