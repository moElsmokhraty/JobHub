import 'dart:convert';
import 'package:equatable/equatable.dart';

class CreateJobRequest extends Equatable {
  final String? title;
  final String? location;
  final String? company;
  final String? description;
  final String? salary;
  final String? period;
  final String? contract;
  final List<String>? requirements;
  final String? imageUrl;
  final String? agentId;

  const CreateJobRequest({
    this.title,
    this.location,
    this.company,
    this.description,
    this.salary,
    this.period,
    this.contract,
    this.requirements,
    this.imageUrl,
    this.agentId,
  });

  factory CreateJobRequest.fromMap(Map<String, dynamic> data) {
    return CreateJobRequest(
      title: data['title'] as String?,
      location: data['location'] as String?,
      company: data['company'] as String?,
      description: data['description'] as String?,
      salary: data['salary'] as String?,
      period: data['period'] as String?,
      contract: data['contract'] as String?,
      requirements: data['requirements'] as List<String>?,
      imageUrl: data['imageUrl'] as String?,
      agentId: data['agentId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'location': location,
        'company': company,
        'description': description,
        'salary': salary,
        'period': period,
        'contract': contract,
        'requirements': requirements,
        'imageUrl': imageUrl,
        'agentId': agentId,
      };

  factory CreateJobRequest.fromJson(String data) {
    return CreateJobRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      title,
      location,
      company,
      description,
      salary,
      period,
      contract,
      requirements,
      imageUrl,
      agentId,
    ];
  }
}
