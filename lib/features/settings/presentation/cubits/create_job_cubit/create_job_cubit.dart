import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';
import 'package:job_hub/features/settings/data/models/create_job_models/create_job_request.dart';

part 'create_job_state.dart';

class CreateJobCubit extends Cubit<CreateJobState> {
  CreateJobCubit(this._jobsRepoImpl) : super(CreateJobInitial());

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

  Future<void> createJob(CreateJobRequest request) async {
    emit(CreateJobLoading());
    var response = await _jobsRepoImpl.createJob(request);
    response.fold((failure) {
      emit(CreateJobFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(CreateJobSuccess());
    });
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
