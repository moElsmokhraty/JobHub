import 'package:bloc/bloc.dart';
import 'package:job_hub/features/bookmarks/data/models/delete_bookmark_request.dart';
import 'package:meta/meta.dart';
import 'package:job_hub/features/bookmarks/data/models/bookmark.dart';
import 'package:job_hub/features/bookmarks/data/repos/bookmarks_repo_impl.dart';
import 'package:job_hub/features/bookmarks/data/models/add_bookmark_request.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit(this._bookmarksRepoImpl) : super(BookmarksInitial());

  final BookmarksRepoImpl _bookmarksRepoImpl;

  Future<void> addBookmark(AddBookmarkRequest request) async {
    emit(AddBookmarkLoading());
    var result = await _bookmarksRepoImpl.addBookmark(request);
    result.fold((failure) {
      emit(AddBookmarkFailure(failure.errMessage));
    }, (response) {
      emit(AddBookmarkSuccess());
    });
  }

  Future<void> deleteBookmark(DeleteBookmarkRequest request) async {
    emit(DeleteBookmarkLoading());
    var result = await _bookmarksRepoImpl.deleteBookmark(request);
    result.fold((failure) {
      emit(DeleteBookmarkFailure(failure.errMessage));
    }, (response) {
      emit(DeleteBookmarkSuccess());
    });
  }

  Future<void> getAllBookmarks() async {
    emit(GetAllBookmarksLoading());
    var result = await _bookmarksRepoImpl.getAllBookmarks();
    result.fold((failure) {
      emit(GetAllBookmarksFailure(failure.errMessage));
    }, (response) {
      emit(GetAllBookmarksSuccess(response.bookmarks ?? []));
    });
  }
}
