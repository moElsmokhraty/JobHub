import 'dart:convert';

import 'package:equatable/equatable.dart';

class AccessChatRequest extends Equatable {
  final String userId;

  const AccessChatRequest({required this.userId});

  factory AccessChatRequest.fromMap(Map<String, dynamic> data) {
    return AccessChatRequest(
      userId: data['userId'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
      };

  factory AccessChatRequest.fromJson(String data) {
    return AccessChatRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [userId];
}
