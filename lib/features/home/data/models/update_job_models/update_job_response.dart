import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../job.dart';

class UpdateJobResponse extends Equatable {
  final bool? status;
  final Job? job;

  const UpdateJobResponse({this.status, this.job});

  factory UpdateJobResponse.fromMap(Map<String, dynamic> data) {
    return UpdateJobResponse(
      status: data['status'] as bool?,
      job: data['job'] == null
          ? null
          : Job.fromMap(data['job'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'job': job?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpdateJobResponse].
  factory UpdateJobResponse.fromJson(String data) {
    return UpdateJobResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpdateJobResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, job];
}
