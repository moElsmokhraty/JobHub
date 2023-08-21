import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeleteBookmarkRequest extends Equatable {
  final String? bookmarkId;

  const DeleteBookmarkRequest({required this.bookmarkId});

  factory DeleteBookmarkRequest.fromMap(Map<String, dynamic> data) {
    return DeleteBookmarkRequest(
      bookmarkId: data['bookmarkId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'bookmarkId': bookmarkId,
      };

  factory DeleteBookmarkRequest.fromJson(String data) {
    return DeleteBookmarkRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [bookmarkId];
}
