import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/core/utils/api_config/api_service.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:job_hub/core/utils/api_config/api_config.dart';
import 'package:job_hub/features/bookmarks/data/models/delete_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/data/repos/bookmarks_repo.dart';
import 'package:job_hub/features/bookmarks/data/models/get_all_bookmarks_response.dart';
import 'package:job_hub/features/bookmarks/data/models/add_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/data/models/add_and_delete_bookmark_response.dart';

class BookmarksRepoImpl implements BookmarksRepo {
  final ApiService _apiService;

  BookmarksRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AddAndDeleteBookmarkResponse>> addBookmark(
      AddBookmarkRequest model) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.addBookmarkEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(AddAndDeleteBookmarkResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AddAndDeleteBookmarkResponse>> deleteBookmark(
      DeleteBookmarkRequest model) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.deleteBookmarkEndpoint,
        token: token,
        data: model.toMap(),
      );
      return Right(AddAndDeleteBookmarkResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetAllBookmarksResponse>> getAllBookmarks() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllBookmarksEndpoint,
        token: token,
      );
      return Right(GetAllBookmarksResponse.fromMap(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
