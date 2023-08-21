import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_job_response.dart';
import 'package:job_hub/features/home/data/models/search_jobs_response.dart';
import 'package:job_hub/features/home/data/repos/jobs_repo/jobs_repo.dart';
import 'package:job_hub/features/home/data/models/get_job_models/get_all_jobs_response.dart';

class JobsRepoImpl implements JobsRepo {
  final ApiService _apiService;

  JobsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetAllJobsResponse>> getAllJobs() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllJobsEndpoint,
        token: token,
      );
      return Right(GetAllJobsResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetJobResponse>> getJob(String jobId) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllJobsEndpoint,
        token: token,
        query: {"jobId": jobId},
      );
      return Right(GetJobResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SearchJobsResponse>> searchJobs(
      String searchTerm) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.searchJobsEndpoint,
        token: token,
        query: {"q": searchTerm},
      );
      return Right(SearchJobsResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
