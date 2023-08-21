import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:job_hub/features/home/data/models/job.dart';

class Bookmark extends Equatable {
  final String? id;
  final Job? job;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Bookmark({
    this.id,
    this.job,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Bookmark.fromMap(Map<String, dynamic> data) => Bookmark(
        id: data['_id'] as String?,
        job: data['job'] == null
            ? null
            : Job.fromMap(data['job'] as Map<String, dynamic>),
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
        'job': job?.toMap(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
  factory Bookmark.fromJson(String data) {
    return Bookmark.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, job, createdAt, updatedAt, v];
}
