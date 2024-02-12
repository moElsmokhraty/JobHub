import 'dart:convert';
import 'package:equatable/equatable.dart';

class DeleteJobResponse extends Equatable {
  final bool? status;
  final String? message;

  const DeleteJobResponse({this.status, this.message});

  factory DeleteJobResponse.fromMap(Map<String, dynamic> data) {
    return DeleteJobResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory DeleteJobResponse.fromJson(String data) {
    return DeleteJobResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
