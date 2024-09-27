// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeolocationDataEntityAdapter extends TypeAdapter<GeolocationDataEntity> {
  @override
  final int typeId = 1;

  @override
  GeolocationDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeolocationDataEntity(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      altitude: fields[2] as double,
      accuracy: fields[3] as double,
      speed: fields[4] as double,
      speedAccuracy: fields[5] as double,
      timestamp: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GeolocationDataEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.altitude)
      ..writeByte(3)
      ..write(obj.accuracy)
      ..writeByte(4)
      ..write(obj.speed)
      ..writeByte(5)
      ..write(obj.speedAccuracy)
      ..writeByte(6)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionEntityAdapter extends TypeAdapter<SessionEntity> {
  @override
  final int typeId = 2;

  @override
  SessionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionEntity(
      id: fields[0] as int,
      date: fields[1] as DateTime,
      distance: fields[2] as double,
      duration: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SessionEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.distance)
      ..writeByte(3)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
