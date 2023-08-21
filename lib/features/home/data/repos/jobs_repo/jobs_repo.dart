import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_job_response.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_all_jobs_response.dart';
import 'package:job_hub/features/home/data/models/search_jobs_response.dart';

abstract class JobsRepo {
  Future<Either<Failure, GetAllJobsResponse>> getAllJobs();

  Future<Either<Failure, GetJobResponse>> getJob(String jobId);

  Future<Either<Failure, SearchJobsResponse>> searchJobs(String searchTerm);
}
