part of 'create_job_cubit.dart';

@immutable
abstract class CreateJobState {}

class CreateJobInitial extends CreateJobState {}

class CreateJobLoading extends CreateJobState {}

class CreateJobSuccess extends CreateJobState {}

class CreateJobFailure extends CreateJobState {
  final String errMessage;

  CreateJobFailure({required this.errMessage});
}
