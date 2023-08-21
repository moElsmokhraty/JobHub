import 'dart:convert';

import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String? id;
  final String? title;
  final String? location;
  final String? company;
  final String? description;
  final String? salary;
  final String? period;
  final String? contract;
  final List<dynamic>? requirements;
  final String? imageUrl;
  final String? agentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Job({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Job.fromMap(Map<String, dynamic> data) => Job(
        id: data['_id'] as String?,
        title: data['title'] as String?,
        location: data['location'] as String?,
        company: data['company'] as String?,
        description: data['description'] as String?,
        salary: data['salary'] as String?,
        period: data['period'] as String?,
        contract: data['contract'] as String?,
        requirements: data['requirements'] as List<dynamic>?,
        imageUrl: data['imageUrl'] as String?,
        agentId: data['agentId'] as String?,
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
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
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
      period,
      contract,
      requirements,
      imageUrl,
      agentId,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
