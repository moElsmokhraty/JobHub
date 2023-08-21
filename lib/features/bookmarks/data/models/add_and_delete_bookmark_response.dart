import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddAndDeleteBookmarkResponse extends Equatable {
  final bool? status;
  final String? message;

  const AddAndDeleteBookmarkResponse({this.status, this.message});

  factory AddAndDeleteBookmarkResponse.fromMap(Map<String, dynamic> data) {
    return AddAndDeleteBookmarkResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory AddAndDeleteBookmarkResponse.fromJson(String data) {
    return AddAndDeleteBookmarkResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
