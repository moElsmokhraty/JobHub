import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_hub/features/home/data/models/job.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo_impl.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit(this._jobsRepoImpl) : super(JobsInitial());

  final JobsRepoImpl _jobsRepoImpl;

  TextEditingController searchController = TextEditingController();

  Future<void> getAllJobs() async {
    emit(GetAllJobsLoading());
    var response = await _jobsRepoImpl.getAllJobs();
    response.fold((failure) {
      emit(GetAllJobsFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(GetAllJobsSuccess(jobs: response.jobs ?? []));
    });
  }

  Future<void> getJob(String jobId) async {
    emit(GetJobLoading());
    var response = await _jobsRepoImpl.getJob(jobId);
    response.fold((failure) {
      emit(GetJobFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(GetJobSuccess(job: response.job!));
    });
  }

  Future<void> searchJobs(String searchTerm) async {
    emit(SearchJobsLoading());
    var response = await _jobsRepoImpl.searchJobs(searchTerm);
    response.fold((failure) {
      emit(SearchJobsFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(SearchJobsSuccess(searchResults: response.searchResults ?? []));
    });
  }
}
