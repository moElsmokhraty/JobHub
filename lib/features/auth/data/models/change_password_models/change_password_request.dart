import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChangePasswordRequest extends Equatable {
  final String? currentPassword;
  final String? newPassword;

  const ChangePasswordRequest({this.currentPassword, this.newPassword});

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> data) {
    return ChangePasswordRequest(
      currentPassword: data['currentPassword'] as String?,
      newPassword: data['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ChangePasswordRequest].
  factory ChangePasswordRequest.fromJson(String data) {
    return ChangePasswordRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ChangePasswordRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
