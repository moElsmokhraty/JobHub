import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';
import 'package:job_hub/features/auth/presentation/cubits/media_cubit/media_cubit.dart';
import 'package:job_hub/features/settings/data/models/update_job_models/update_job_request.dart';

part 'update_job_state.dart';

class UpdateJobCubit extends Cubit<UpdateJobState> {
  UpdateJobCubit(this._jobsRepoImpl) : super(UpdateJobInitial());

  final JobsRepoImpl _jobsRepoImpl;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController jobTitleController = TextEditingController();

  TextEditingController jobDescriptionController = TextEditingController();

  TextEditingController jobLocationController = TextEditingController();

  TextEditingController jobSalaryController = TextEditingController();

  TextEditingController jobCompanyController = TextEditingController();

  TextEditingController jobWorkHoursController = TextEditingController();

  TextEditingController jobContractPeriodController = TextEditingController();

  TextEditingController jobFirstRequirementController = TextEditingController();

  TextEditingController jobSecondRequirementController =
      TextEditingController();

  TextEditingController jobThirdRequirementController = TextEditingController();

  TextEditingController jobFourthRequirementController =
      TextEditingController();

  Future<void> updateJob(UpdateJobRequest request) async {
    emit(UpdateJobLoading());
    var response = await _jobsRepoImpl.updateJob(request);
    response.fold((failure) {
      emit(UpdateJobFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(UpdateJobSuccess());
    });
  }

  void setValues(Job job, BuildContext context) {
    BlocProvider.of<MediaCubit>(context).imageUrl = job.imageUrl;
    jobTitleController.text = job.title ?? '';
    jobDescriptionController.text = job.description ?? '';
    jobLocationController.text = job.location ?? '';
    jobSalaryController.text = job.salary ?? '';
    jobCompanyController.text = job.company ?? '';
    jobWorkHoursController.text = job.workHours ?? '';
    jobContractPeriodController.text = job.contractPeriod ?? '';
    jobFirstRequirementController.text = job.requirements?[0] ?? '';
    jobSecondRequirementController.text = job.requirements?[1] ?? '';
    jobThirdRequirementController.text = job.requirements?[2] ?? '';
    jobFourthRequirementController.text = job.requirements?[3] ?? '';
  }

  void reset() {
    key.currentState!.reset();
    jobTitleController.clear();
    jobDescriptionController.clear();
    jobLocationController.clear();
    jobSalaryController.clear();
    jobCompanyController.clear();
    jobWorkHoursController.clear();
    jobContractPeriodController.clear();
    jobFirstRequirementController.clear();
    jobSecondRequirementController.clear();
    jobThirdRequirementController.clear();
    jobFourthRequirementController.clear();
  }
}
