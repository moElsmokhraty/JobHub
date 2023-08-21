import 'dart:convert';
import 'package:equatable/equatable.dart';

import 'message.dart';

class GetAllMessagesResponse extends Equatable {
  final bool? status;
  final List<Message>? messages;
  final String? message;

  const GetAllMessagesResponse({this.status, this.messages, this.message});

  factory GetAllMessagesResponse.fromMap(Map<String, dynamic> data) {
    return GetAllMessagesResponse(
      status: data['status'] as bool?,
      messages: (data['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromMap(e as Map<String, dynamic>))
          .toList(),
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'messages': messages?.map((e) => e.toMap()).toList(),
        'message': message
      };

  factory GetAllMessagesResponse.fromJson(String data) {
    return GetAllMessagesResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        status,
        messages,
        message,
      ];
}
