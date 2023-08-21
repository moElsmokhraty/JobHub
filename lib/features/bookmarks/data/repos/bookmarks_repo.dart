import 'package:dartz/dartz.dart';
import 'package:job_hub/core/errors/failure.dart';
import 'package:job_hub/features/bookmarks/data/models/add_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/data/models/add_and_delete_bookmark_response.dart';
import 'package:job_hub/features/bookmarks/data/models/delete_bookmark_request.dart';
import 'package:job_hub/features/bookmarks/data/models/get_all_bookmarks_response.dart';

abstract class BookmarksRepo {
  Future<Either<Failure, AddAndDeleteBookmarkResponse>> addBookmark(
      AddBookmarkRequest model);

  Future<Either<Failure, AddAndDeleteBookmarkResponse>> deleteBookmark(
      DeleteBookmarkRequest model);

  Future<Either<Failure, GetAllBookmarksResponse>> getAllBookmarks();
}
