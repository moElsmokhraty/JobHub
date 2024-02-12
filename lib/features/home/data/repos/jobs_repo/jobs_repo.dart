import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/home/data/models/search_jobs_response.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_job_response.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_all_jobs_response.dart';
import 'package:job_hub/features/settings/data/models/create_job_models/create_job_request.dart';
import 'package:job_hub/features/settings/data/models/create_job_models/create_job_response.dart';
import 'package:job_hub/features/settings/data/models/delete_job_models/delete_job_request.dart';
import 'package:job_hub/features/settings/data/models/delete_job_models/delete_job_response.dart';
import 'package:job_hub/features/settings/data/models/update_job_models/update_job_request.dart';
import 'package:job_hub/features/settings/data/models/update_job_models/update_job_response.dart';

abstract class JobsRepo {
  Future<Either<Failure, CreateJobResponse>> createJob(
      CreateJobRequest request);

  Future<Either<Failure, GetJobResponse>> getJob(String jobId);

  Future<Either<Failure, GetAllJobsResponse>> getAllJobs();

  Future<Either<Failure, UpdateJobResponse>> updateJob(
      UpdateJobRequest request);

  Future<Either<Failure, DeleteJobResponse>> deleteJob(
      DeleteJobRequest request);

  Future<Either<Failure, SearchJobsResponse>> searchJobs(String searchTerm);
}
