part of 'bookmarks_cubit.dart';

@immutable
abstract class BookmarksState {}

class BookmarksInitial extends BookmarksState {}

class AddBookmarkLoading extends BookmarksState {}

class AddBookmarkSuccess extends BookmarksState {}

class AddBookmarkFailure extends BookmarksState {
  final String errMessage;

  AddBookmarkFailure(this.errMessage);
}

class DeleteBookmarkLoading extends BookmarksState {}

class DeleteBookmarkSuccess extends BookmarksState {}

class DeleteBookmarkFailure extends BookmarksState {
  final String errMessage;

  DeleteBookmarkFailure(this.errMessage);
}

class GetAllBookmarksLoading extends BookmarksState {}

class GetAllBookmarksSuccess extends BookmarksState {
  final List<Bookmark> bookmarks;

  GetAllBookmarksSuccess(this.bookmarks);
}

class GetAllBookmarksFailure extends BookmarksState {
  final String errMessage;

  GetAllBookmarksFailure(this.errMessage);
}
