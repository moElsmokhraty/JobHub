import 'dart:convert';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';

class LoginResponse {
  bool? status;
  UserData? userData;
  String? token;
  String? message;

  LoginResponse({this.status, this.userData, this.token, this.message});

  factory LoginResponse.fromMap(Map<String, dynamic> data) => LoginResponse(
        status: data['status'] as bool?,
        userData: data['userData'] == null
            ? null
            : UserData.fromMap(data['userData'] as Map<String, dynamic>),
        token: data['token'] as String?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'userData': userData?.toMap(),
        'token': token,
        'message': message
      };

  factory LoginResponse.fromJson(String data) {
    return LoginResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
