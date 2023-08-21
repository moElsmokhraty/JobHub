import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'bookmark.dart';

class GetAllBookmarksResponse extends Equatable {
  final bool? status;
  final List<Bookmark>? bookmarks;

  const GetAllBookmarksResponse({this.status, this.bookmarks});

  factory GetAllBookmarksResponse.fromMap(Map<String, dynamic> data) {
    return GetAllBookmarksResponse(
      status: data['status'] as bool?,
      bookmarks: (data['bookmarks'] as List<dynamic>?)
          ?.map((e) => Bookmark.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'bookmarks': bookmarks?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetAllBookmarksResponse].
  factory GetAllBookmarksResponse.fromJson(String data) {
    return GetAllBookmarksResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetAllBookmarksResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, bookmarks];
}
