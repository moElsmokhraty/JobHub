import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendMessageRequest extends Equatable {
  final String content;
  final String receiver;
  final String chat;

  const SendMessageRequest(
      {required this.content, required this.receiver, required this.chat});

  factory SendMessageRequest.fromMap(Map<String, dynamic> data) {
    return SendMessageRequest(
      content: data['content'] as String,
      receiver: data['receiver'] as String,
      chat: data['chat'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'content': content,
        'receiver': receiver,
        'chat': chat,
      };

  factory SendMessageRequest.fromJson(String data) {
    return SendMessageRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [content, receiver, chat];
}
