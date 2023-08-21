import 'dart:convert';

class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final String location;
  final String phone;
  final String? imageUrl;
  final List<dynamic> skills;

  RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.location,
    required this.phone,
    this.imageUrl,
    required this.skills,
  });

  factory RegisterRequest.fromMap(Map<String, dynamic> data) {
    return RegisterRequest(
      username: data['username'] as String,
      email: data['email'] as String,
      password: data['password'] as String,
      location: data['location'] as String,
      phone: data['phone'] as String,
      imageUrl: data['imageUrl'] as String?,
      skills: data['skills'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toMap() => {
        'username': username,
        'email': email,
        'password': password,
        'location': location,
        'phone': phone,
        'imageUrl': imageUrl,
        'skills': skills
      };

  factory RegisterRequest.fromJson(String data) {
    return RegisterRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
