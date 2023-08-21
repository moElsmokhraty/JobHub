import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';

class UpdateUserResponse extends Equatable {
  final bool? status;
  final UserData? userData;
  final String? message;

  const UpdateUserResponse({this.status, this.userData, this.message});

  factory UpdateUserResponse.fromMap(Map<String, dynamic> data) {
    return UpdateUserResponse(
      status: data['status'] as bool?,
      userData: data['userData'] == null
          ? null
          : UserData.fromMap(data['userData'] as Map<String, dynamic>),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'userData': userData?.toMap(),
        'message': message,
      };

  factory UpdateUserResponse.fromJson(String data) {
    return UpdateUserResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, userData, message];
}
