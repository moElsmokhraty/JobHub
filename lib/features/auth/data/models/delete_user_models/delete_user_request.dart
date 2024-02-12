import 'dart:convert';
import 'package:equatable/equatable.dart';

class DeleteUserRequest extends Equatable {
  final String? userId;
  final String? password;

  const DeleteUserRequest({required this.userId, this.password});

  factory DeleteUserRequest.fromMap(Map<String, dynamic> data) {
    return DeleteUserRequest(
      userId: data['userId'] as String?,
      password: data['password'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'password': password,
      };

  factory DeleteUserRequest.fromJson(String data) {
    return DeleteUserRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [userId, password];
}
