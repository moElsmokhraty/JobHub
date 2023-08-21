import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChangePasswordResponse extends Equatable {
  final bool? status;
  final String? message;

  const ChangePasswordResponse({this.status, this.message});

  factory ChangePasswordResponse.fromMap(Map<String, dynamic> data) {
    return ChangePasswordResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChangePasswordResponse].
  factory ChangePasswordResponse.fromJson(String data) {
    return ChangePasswordResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChangePasswordResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
