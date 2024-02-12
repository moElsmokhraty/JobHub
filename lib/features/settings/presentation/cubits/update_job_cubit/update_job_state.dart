part of 'update_job_cubit.dart';

@immutable
abstract class UpdateJobState {}

class UpdateJobInitial extends UpdateJobState {}

class UpdateJobLoading extends UpdateJobState {}

class UpdateJobSuccess extends UpdateJobState {}

class UpdateJobFailure extends UpdateJobState {
  final String errMessage;

  UpdateJobFailure({required this.errMessage});
}
