import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';

import 'text_fields_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/functions/show_snack_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/spacers/height_spacer.dart';
import 'package:job_hub/features/home/presentation/cubits/jobs_cubit.dart';
import 'package:job_hub/features/settings/presentation/cubits/create_job_cubit/create_job_cubit.dart';
import 'package:job_hub/features/settings/presentation/views/create_job_view/widgets/create_job_button.dart';

class CreateJobViewBody extends StatelessWidget {
  const CreateJobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CreateJobCubit cubit = BlocProvider.of(context);
    return BlocConsumer<CreateJobCubit, CreateJobState>(
      listener: (context, state) async {
        if (state is CreateJobSuccess) {
          showCustomSnackBar(context, 'Job created successfully');
          BlocProvider.of<MediaCubit>(context).imageUrl = null;
          await BlocProvider.of<JobsCubit>(context).getAllJobs().then((value) {
            GoRouter.of(context).pop();
            cubit.reset();
          });
        } else if (state is CreateJobFailure) {
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
              CreateJobButton(state: state, cubit: cubit)
            ],
          ),
        );
      },
    );
  }
}
