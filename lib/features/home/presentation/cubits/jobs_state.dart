part of 'jobs_cubit.dart';

@immutable
abstract class JobsState {}

class JobsInitial extends JobsState {}

class GetAllJobsLoading extends JobsState {}

class GetAllJobsFailure extends JobsState {
  final String errMessage;

  GetAllJobsFailure({required this.errMessage});
}

class GetAllJobsSuccess extends JobsState {
  final List<Job> jobs;

  GetAllJobsSuccess({required this.jobs});
}

class GetJobLoading extends JobsState {}

class GetJobFailure extends JobsState {
  final String errMessage;

  GetJobFailure({required this.errMessage});
}

class GetJobSuccess extends JobsState {
  final Job job;

  GetJobSuccess({required this.job});
}

class SearchJobsLoading extends JobsState {}

class SearchJobsFailure extends JobsState {
  final String errMessage;

  SearchJobsFailure({required this.errMessage});
}

class SearchJobsSuccess extends JobsState {
  final List<dynamic> searchResults;

  SearchJobsSuccess({required this.searchResults});
}
