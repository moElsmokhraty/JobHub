import 'dart:convert';

class UserData {
  String? id;
  String? username;
  String? email;
  bool? isAdmin;
  bool? isAgent;
  String? createdAt;
  String? location;
  String? phone;
  List<dynamic>? skills;
  String? imageUrl;
  String? message;

  UserData({
    this.id,
    this.username,
    this.email,
    this.isAdmin,
    this.isAgent,
    this.createdAt,
    this.location,
    this.phone,
    this.skills,
    this.imageUrl,
    this.message,
  });

  factory UserData.fromMap(Map<String, dynamic> data) => UserData(
        id: data['_id'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        isAdmin: data['isAdmin'] as bool?,
        isAgent: data['isAgent'] as bool?,
        createdAt: data['createdAt'] as String?,
        location: data['location'] as String?,
        phone: data['phone'] as String?,
        skills: data['skills'] as List<dynamic>?,
        imageUrl: data['imageUrl'] as String?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'username': username,
        'email': email,
        'isAdmin': isAdmin,
        'isAgent': isAgent,
        'createdAt': createdAt,
        'location': location,
        'phone': phone,
        'skills': skills,
        'imageUrl': imageUrl,
        'message': message
      };

  factory UserData.fromJson(String data) {
    return UserData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
