import 'dart:convert';

class UpdateUserRequest {
  final String location;
  final String phone;
  final String imageUrl;
  final List<String?> skills;

  UpdateUserRequest({
    required this.location,
    required this.phone,
    required this.imageUrl,
    required this.skills,
  });

  factory UpdateUserRequest.fromMap(Map<String, dynamic> data) {
    return UpdateUserRequest(
      location: data['location'] as String,
      phone: data['phone'] as String,
      imageUrl: data['imageUrl'] as String,
      skills: data['skills'] as List<String?>,
    );
  }

  Map<String, dynamic> toMap() => {
        'location': location,
        'phone': phone,
        'imageUrl': imageUrl,
        'skills': skills,
      };

  factory UpdateUserRequest.fromJson(String data) {
    return UpdateUserRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
