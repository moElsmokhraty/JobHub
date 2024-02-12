import 'dart:convert';
import 'package:equatable/equatable.dart';

class SendMessageRequest extends Equatable {
  final String content;
  final String receiverId;
  final String chatId;
  final String? message;

  const SendMessageRequest({
    required this.content,
    required this.receiverId,
    required this.chatId,
    this.message,
  });

  factory SendMessageRequest.fromMap(Map<String, dynamic> data) {
    return SendMessageRequest(
      content: data['content'] as String,
      receiverId: data['receiverId'] as String,
      chatId: data['chatId'] as String,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'content': content,
        'receiverId': receiverId,
        'chatId': chatId,
        'message': message,
      };

  factory SendMessageRequest.fromJson(String data) {
    return SendMessageRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [content, receiverId, chatId];
}
