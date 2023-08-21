import 'dart:convert';
import 'package:equatable/equatable.dart';

class AddBookmarkRequest extends Equatable {
  final String jobId;

  const AddBookmarkRequest({required this.jobId});

  factory AddBookmarkRequest.fromMap(Map<String, dynamic> data) {
    return AddBookmarkRequest(
      jobId: data['jobId'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'jobId': jobId,
      };

  factory AddBookmarkRequest.fromJson(String data) {
    return AddBookmarkRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [jobId];
}
