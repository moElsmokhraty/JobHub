import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/profile/data/models/update_user_models/user_data.dart';

class GetAllUsersResponse extends Equatable {
  final bool? status;
  final List<UserData>? users;
  final String? message;

  const GetAllUsersResponse({this.status, this.users, this.message});

  factory GetAllUsersResponse.fromMap(Map<String, dynamic> data) {
    return GetAllUsersResponse(
      status: data['status'] as bool?,
      users: (data['users'] as List<dynamic>?)
          ?.map((e) => UserData.fromMap(e as Map<String, dynamic>))
          .toList(),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'users': users?.map((e) => e.toMap()).toList(),
        'message': message,
      };

  factory GetAllUsersResponse.fromJson(String data) {
    return GetAllUsersResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, users];
}
