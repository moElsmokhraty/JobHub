import 'dart:convert';
import 'package:equatable/equatable.dart';

class SearchJobsResponse extends Equatable {
  final bool? status;
  final String? message;
  final List<dynamic>? searchResults;

  const SearchJobsResponse({this.status, this.message, this.searchResults});

  factory SearchJobsResponse.fromMap(Map<String, dynamic> data) {
    return SearchJobsResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
      searchResults: data['searchResults'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'searchResults': searchResults,
        'message': message,
      };

  factory SearchJobsResponse.fromJson(String data) {
    return SearchJobsResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        status,
        message,
        searchResults,
      ];
}
