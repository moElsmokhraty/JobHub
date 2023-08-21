import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/message.dart';

class Chat extends Equatable {
  final String? id;
  final String? chatName;
  final bool? isGroupChat;
  final List<UserData>? users;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Message? latestMessage;

  const Chat({
    this.id,
    this.chatName,
    this.isGroupChat,
    this.users,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.latestMessage,
  });

  factory Chat.fromMap(Map<String, dynamic> data) => Chat(
        id: data['_id'] as String?,
        chatName: data['chatName'] as String?,
        isGroupChat: data['isGroupChat'] as bool?,
        users: (data['users'] as List<dynamic>?)
            ?.map((e) => UserData.fromMap(e as Map<String, dynamic>))
            .toList(),
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        v: data['__v'] as int?,
        latestMessage: data['latestMessage'] == null
            ? null
            : Message.fromMap(data['latestMessage'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'chatName': chatName,
        'isGroupChat': isGroupChat,
        'users': users?.map((e) => e.toMap()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'latestMessage': latestMessage?.toMap(),
      };

  factory Chat.fromJson(String data) {
    return Chat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      chatName,
      isGroupChat,
      users,
      createdAt,
      updatedAt,
      v,
      latestMessage,
    ];
  }
}
