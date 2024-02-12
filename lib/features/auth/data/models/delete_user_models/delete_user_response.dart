import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeleteUserResponse extends Equatable {
  final bool? status;
  final String? message;

  const DeleteUserResponse({this.status, this.message});

  factory DeleteUserResponse.fromMap(Map<String, dynamic> data) {
    return DeleteUserResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory DeleteUserResponse.fromJson(String data) {
    return DeleteUserResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
