import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../job.dart';

class GetJobResponse extends Equatable {
  final bool? status;
  final Job? job;
  final String? message;

  const GetJobResponse({this.status, this.job, this.message});

  factory GetJobResponse.fromMap(Map<String, dynamic> data) {
    return GetJobResponse(
        status: data['status'] as bool?,
        job: data['job'] == null
            ? null
            : Job.fromMap(data['job'] as Map<String, dynamic>),
        message: data['message'] as String?);
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'job': job?.toMap(),
        'message': message,
      };

  factory GetJobResponse.fromJson(String data) {
    return GetJobResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, job];
}
