import 'dart:convert';
import 'package:equatable/equatable.dart';

class CreateJobResponse extends Equatable {
  final bool? status;
  final String? message;

  const CreateJobResponse({this.status, this.message});

  factory CreateJobResponse.fromMap(Map<String, dynamic> data) {
    return CreateJobResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory CreateJobResponse.fromJson(String data) {
    return CreateJobResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
