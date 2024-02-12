import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateJobRequest extends Equatable {
  final String? title;
  final String? location;
  final String? company;
  final String? description;
  final String? salary;
  final String? workHours;
  final String? contractPeriod;
  final String? imageUrl;
  final List<String>? requirements;

  const CreateJobRequest({
    this.title,
    this.location,
    this.company,
    this.description,
    this.salary,
    this.workHours,
    this.contractPeriod,
    this.imageUrl,
    this.requirements,
  });

  factory CreateJobRequest.fromMap(Map<String, dynamic> data) {
    return CreateJobRequest(
      title: data['title'] as String?,
      location: data['location'] as String?,
      company: data['company'] as String?,
      description: data['description'] as String?,
      salary: data['salary'] as String?,
      workHours: data['workHours'] as String?,
      contractPeriod: data['contractPeriod'] as String?,
      imageUrl: data['imageUrl'] as String?,
      requirements: data['requirements'] as List<String>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'location': location,
        'company': company,
        'description': description,
        'salary': salary,
        'workHours': workHours,
        'contractPeriod': contractPeriod,
        'imageUrl': imageUrl,
        'requirements': requirements,
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
      workHours,
      contractPeriod,
      imageUrl,
      requirements,
    ];
  }
}
