import 'package:hive/hive.dart';
import 'package:geolocator/geolocator.dart';
import 'package:run_tracker/domain/metrics/checkpoint.dart';

part 'entity.g.dart';

@HiveType(typeId: 1)
class GeolocationDataEntity {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final double altitude;

  @HiveField(3)
  final double accuracy;

  @HiveField(4)
  final double speed;

  @HiveField(5)
  final double speedAccuracy;

  @HiveField(6)
  final DateTime timestamp;

  GeolocationDataEntity({
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.accuracy,
    required this.speed,
    required this.speedAccuracy,
    required this.timestamp,
  });

  factory GeolocationDataEntity.fromPosition(Position position) {
    return GeolocationDataEntity(
      latitude: position.latitude,
      longitude: position.longitude,
      altitude: position.altitude,
      accuracy: position.accuracy,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      timestamp: position.timestamp,
    );
  }
}

@HiveType(typeId: 2)
  class SessionEntity extends HiveObject {
    @HiveField(0)
    final int id; 

    @HiveField(1)
    final DateTime date;

    @HiveField(2)
    final double distance;

    @HiveField(3)
    final int duration;

    SessionEntity({
      required this.id,
      required this.date,
      required this.distance,
      required this.duration,
    });
  }
