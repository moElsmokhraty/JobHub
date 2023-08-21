import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:job_hub/features/chat/data/models/chat_models/chat.dart';

class AccessChatResponse extends Equatable {
  final bool? status;
  final Chat? fullChat;

  const AccessChatResponse({this.status, this.fullChat});

  factory AccessChatResponse.fromMap(Map<String, dynamic> data) {
    return AccessChatResponse(
      status: data['status'] as bool?,
      fullChat: data['fullChat'] == null
          ? null
          : Chat.fromMap(data['fullChat'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'fullChat': fullChat?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AccessChatResponse].
  factory AccessChatResponse.fromJson(String data) {
    return AccessChatResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AccessChatResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, fullChat];
}
