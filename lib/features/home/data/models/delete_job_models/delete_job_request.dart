import 'dart:convert';
import 'package:equatable/equatable.dart';

class DeleteJobRequest extends Equatable {
  final String? jobId;

  const DeleteJobRequest({this.jobId});

  factory DeleteJobRequest.fromMap(Map<String, dynamic> data) {
    return DeleteJobRequest(
      jobId: data['jobId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'jobId': jobId,
      };

  factory DeleteJobRequest.fromJson(String data) {
    return DeleteJobRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [jobId];
}
