// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckpointImpl _$$CheckpointImplFromJson(Map<String, dynamic> json) =>
    _$CheckpointImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestampMs: (json['timestampMs'] as num).toInt(),
    );

Map<String, dynamic> _$$CheckpointImplToJson(_$CheckpointImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestampMs': instance.timestampMs,
    };
