// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      distance: (json['distance'] as num).toDouble(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      checkpoints: (json['checkpoints'] as List<dynamic>)
          .map((e) => Checkpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'distance': instance.distance,
      'duration': instance.duration.inMicroseconds,
      'checkpoints': instance.checkpoints,
    };
