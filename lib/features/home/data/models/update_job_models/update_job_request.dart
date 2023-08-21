import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdateJobRequest extends Equatable {
  final String? id;
  final String? title;
  final String? location;
  final String? company;
  final String? description;
  final String? salary;
  final String? period;
  final String? contract;
  final List<String>? requirements;
  final String? imageUrl;

  const UpdateJobRequest({
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
  });

  factory UpdateJobRequest.fromMap(Map<String, dynamic> data) {
    return UpdateJobRequest(
      id: data['id'] as String?,
      title: data['title'] as String?,
      location: data['location'] as String?,
      company: data['company'] as String?,
      description: data['description'] as String?,
      salary: data['salary'] as String?,
      period: data['period'] as String?,
      contract: data['contract'] as String?,
      requirements: data['requirements'] as List<String>?,
      imageUrl: data['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'location': location,
        'company': company,
        'description': description,
        'salary': salary,
        'period': period,
        'contract': contract,
        'requirements': requirements,
        'imageUrl': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpdateJobRequest].
  factory UpdateJobRequest.fromJson(String data) {
    return UpdateJobRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpdateJobRequest] to a JSON string.
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
    ];
  }
}
