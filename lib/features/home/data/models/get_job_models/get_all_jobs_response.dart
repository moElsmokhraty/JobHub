import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../job.dart';

class GetAllJobsResponse extends Equatable {
  final bool? status;
  final List<Job>? jobs;
  final String? message;

  const GetAllJobsResponse({this.status, this.jobs, this.message});

  factory GetAllJobsResponse.fromMap(Map<String, dynamic> data) {
    return GetAllJobsResponse(
      status: data['status'] as bool?,
      jobs: (data['jobs'] as List<dynamic>?)
          ?.map((e) => Job.fromMap(e as Map<String, dynamic>))
          .toList(),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'jobs': jobs?.map((e) => e.toMap()).toList(),
        'message': message
      };

  factory GetAllJobsResponse.fromJson(String data) {
    return GetAllJobsResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, jobs];
}
