import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/functions/validate_skills.dart';
import 'package:job_hub/core/widgets/buttons/custom_button.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/settings/data/models/create_job_models/create_job_request.dart';
import 'package:job_hub/features/settings/presentation/cubits/create_job_cubit/create_job_cubit.dart';

class CreateJobButton extends StatelessWidget {
  const CreateJobButton({
    super.key,
    required this.state,
    required this.cubit,
  });

  final CreateJobState state;
  final CreateJobCubit cubit;

  @override
  Widget build(BuildContext context) {
    return state is CreateJobLoading
        ? Center(child: CircularProgressIndicator(color: Color(kOrange.value)))
        : CustomButton(
            text: 'Create Job',
            onTap: () async {
              if (cubit.key.currentState!.validate()) {
                cubit.createJob(
                  CreateJobRequest(
                    title: cubit.jobTitleController.text,
                    description: cubit.jobDescriptionController.text,
                    location: cubit.jobLocationController.text,
                    salary: cubit.jobSalaryController.text,
                    company: cubit.jobCompanyController.text,
                    workHours: cubit.jobWorkHoursController.text,
                    contractPeriod: cubit.jobContractPeriodController.text,
                    imageUrl: BlocProvider.of<MediaCubit>(context).imageUrl,
                    requirements: validateSkills(
                      [
                        cubit.jobFirstRequirementController.text,
                        cubit.jobSecondRequirementController.text,
                        cubit.jobThirdRequirementController.text,
                        cubit.jobFourthRequirementController.text,
                      ],
                    ),
                  ),
                );
              }
            },
          );
  }
}
