import 'dart:convert';
import 'package:equatable/equatable.dart';

import 'chat.dart';

class GetAllChatsResponse extends Equatable {
  final bool? status;
  final List<Chat>? chats;
  final String? message;

  const GetAllChatsResponse({this.status, this.chats, this.message});

  factory GetAllChatsResponse.fromMap(Map<String, dynamic> data) {
    return GetAllChatsResponse(
      status: data['status'] as bool?,
      chats: (data['chats'] as List<dynamic>?)
          ?.map((e) => Chat.fromMap(e as Map<String, dynamic>))
          .toList(),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'chats': chats?.map((e) => e.toMap()).toList(),
        'message': message
      };

  factory GetAllChatsResponse.fromJson(String data) {
    return GetAllChatsResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        status,
        chats,
        message,
      ];
}
