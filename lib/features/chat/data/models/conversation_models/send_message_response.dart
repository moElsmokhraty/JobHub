import 'dart:convert';
import 'package:equatable/equatable.dart';

class SendMessageResponse extends Equatable {
  final bool? status;
  final String? message;

  const SendMessageResponse({this.status, this.message});

  factory SendMessageResponse.fromMap(Map<String, dynamic> data) {
    return SendMessageResponse(
      status: data['status'] as bool?,
      message: data['message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
      };

  factory SendMessageResponse.fromJson(String data) {
    return SendMessageResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
