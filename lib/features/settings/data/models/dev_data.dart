import 'package:equatable/equatable.dart';

class DevData extends Equatable {
  final String? device;
  final String? location;
  final String? platform;
  final String? date;
  final String? ipAddress;

  const DevData({
    this.device,
    this.location,
    this.platform,
    this.date,
    this.ipAddress,
  });

  factory DevData.fromJson(Map<String, dynamic> json) => DevData(
        device: json['device'] as String?,
        location: json['location'] as String?,
        platform: json['platform'] as String?,
        date: json['date'] as String?,
        ipAddress: json['ipAddress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'device': device,
        'location': location,
        'platform': platform,
        'date': date,
        'ipAddress': ipAddress,
      };

  @override
  List<Object?> get props {
    return [
      device,
      location,
      platform,
      date,
      ipAddress,
    ];
  }
}
