import 'dart:convert';

class RegisterResponse {
  bool? status;
  String? message;

  RegisterResponse({this.status, this.message});

  factory RegisterResponse.fromMap(Map<String, dynamic> data) {
    return RegisterResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory RegisterResponse.fromJson(String data) {
    return RegisterResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
