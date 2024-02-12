import 'update_job_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/settings/presentation/cubits/update_job_cubit/update_job_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/update_job_view/widgets/text_fields_list_view.dart';

class UpdateJobViewBody extends StatelessWidget {
  const UpdateJobViewBody({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    UpdateJobCubit cubit = BlocProvider.of(context);
    return BlocConsumer<UpdateJobCubit, UpdateJobState>(
      listener: (context, state) async {
        if (state is UpdateJobSuccess) {
          showCustomSnackBar(context, 'Job Updated Successfully');
          BlocProvider.of<MediaCubit>(context).imageUrl = null;
          await BlocProvider.of<JobsCubit>(context).getAllJobs();
        } else if (state is UpdateJobFailure) {
          showCustomSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.key,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            children: [
              const HeightSpacer(size: 5),
              const TextFieldsListView(),
              const HeightSpacer(size: 10),
              UpdateJobButton(jobId: jobId, state: state, cubit: cubit)
            ],
          ),
        );
      },
    );
  }
}
