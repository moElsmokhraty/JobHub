import 'dart:convert';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromMap(Map<String, dynamic> data) => LoginRequest(
        email: data['email'] as String,
        password: data['password'] as String,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginRequest].
  factory LoginRequest.fromJson(String data) {
    return LoginRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
