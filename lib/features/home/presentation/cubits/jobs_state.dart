part of 'jobs_cubit.dart';

@immutable
abstract class JobsState {}

class JobsInitial extends JobsState {}

class GetAllJobsLoading extends JobsState {}

class GetAllJobsSuccess extends JobsState {
  final List<Job> jobs;

  GetAllJobsSuccess({required this.jobs});
}

class GetAllJobsFailure extends JobsState {
  final String errMessage;

  GetAllJobsFailure({required this.errMessage});
}

class GetJobLoading extends JobsState {}

class GetJobSuccess extends JobsState {
  final Job job;

  GetJobSuccess({required this.job});
}

class GetJobFailure extends JobsState {
  final String errMessage;

  GetJobFailure({required this.errMessage});
}

class DeleteJobLoading extends JobsState {}

class DeleteJobSuccess extends JobsState {}

class DeleteJobFailure extends JobsState {
  final String errMessage;

  DeleteJobFailure({required this.errMessage});
}

class SearchJobsLoading extends JobsState {}

class SearchJobsSuccess extends JobsState {
  final List<dynamic> searchResults;

  SearchJobsSuccess({required this.searchResults});
}

class SearchJobsFailure extends JobsState {
  final String errMessage;

  SearchJobsFailure({required this.errMessage});
}
