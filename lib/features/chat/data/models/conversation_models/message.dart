import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/auth/data/models/update_user_models/user_data.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';

class Message extends Equatable {
  final String? id;
  final UserData? sender;
  final String? content;
  final UserData? receiver;
  final Chat? chat;
  final List<dynamic>? readBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Message({
    this.id,
    this.sender,
    this.content,
    this.receiver,
    this.chat,
    this.readBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Message.fromMap(Map<String, dynamic> data) => Message(
        id: data['_id'] as String?,
        sender: data['sender'] == null
            ? null
            : UserData.fromMap(data['sender'] as Map<String, dynamic>),
        content: data['content'] as String?,
        receiver: data['receiver'] == null
            ? null
            : UserData.fromMap(data['receiver'] as Map<String, dynamic>),
        chat: data['chat'] == null
            ? null
            : Chat.fromMap(data['chat'] as Map<String, dynamic>),
        readBy: data['readBy'] as List<dynamic>?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        v: data['__v'] as int?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'sender': sender?.toMap(),
        'content': content,
        'receiver': receiver,
        'chat': chat,
        'readBy': readBy,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  factory Message.fromJson(String data) {
    return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      sender,
      content,
      receiver,
      chat,
      readBy,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
