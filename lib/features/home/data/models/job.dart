import 'dart:convert';

import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String? id;
  final String? title;
  final String? location;
  final String? company;
  final String? description;
  final String? salary;
  final String? workHours;
  final String? contractPeriod;
  final List<dynamic>? requirements;
  final String? imageUrl;
  final DateTime? createdAt;

  const Job({
    this.id,
    this.title,
    this.location,
    this.company,
    this.description,
    this.salary,
    this.workHours,
    this.contractPeriod,
    this.requirements,
    this.imageUrl,
    this.createdAt,
  });

  factory Job.fromMap(Map<String, dynamic> data) => Job(
      id: data['_id'] as String?,
      title: data['title'] as String?,
      location: data['location'] as String?,
      company: data['company'] as String?,
      description: data['description'] as String?,
      salary: data['salary'] as String?,
      workHours: data['workHours'] as String?,
      contractPeriod: data['contractPeriod'] as String?,
      requirements: data['requirements'] as List<dynamic>?,
      imageUrl: data['imageUrl'] as String?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String));

  Map<String, dynamic> toMap() => {
        '_id': id,
        'title': title,
        'location': location,
        'company': company,
        'description': description,
        'salary': salary,
        'period': workHours,
        'contract': contractPeriod,
        'requirements': requirements,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Job].
  factory Job.fromJson(String data) {
    return Job.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Job] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      title,
      location,
      company,
      description,
      salary,
      workHours,
      contractPeriod,
      requirements,
      imageUrl,
      createdAt,
    ];
  }
}
