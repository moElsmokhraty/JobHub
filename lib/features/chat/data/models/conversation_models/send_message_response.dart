import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/chat/data/models/conversation_models/message.dart';

class SendMessageResponse extends Equatable {
  final bool? status;
  final Message? message;

  const SendMessageResponse({this.status, this.message});

  factory SendMessageResponse.fromMap(Map<String, dynamic> data) {
    return SendMessageResponse(
      status: data['status'] as bool?,
      message: data['sentMessage'] == null
          ? null
          : Message.fromMap(data['sentMessage'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'sentMessage': message?.toMap(),
      };

  factory SendMessageResponse.fromJson(String data) {
    return SendMessageResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
