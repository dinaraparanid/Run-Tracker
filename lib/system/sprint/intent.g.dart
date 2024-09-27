// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PauseTaskIntentImpl _$$PauseTaskIntentImplFromJson(
        Map<String, dynamic> json) =>
    _$PauseTaskIntentImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PauseTaskIntentImplToJson(
        _$PauseTaskIntentImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ResumeTaskIntentImpl _$$ResumeTaskIntentImplFromJson(
        Map<String, dynamic> json) =>
    _$ResumeTaskIntentImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ResumeTaskIntentImplToJson(
        _$ResumeTaskIntentImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$StopTaskIntentImpl _$$StopTaskIntentImplFromJson(Map<String, dynamic> json) =>
    _$StopTaskIntentImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StopTaskIntentImplToJson(
        _$StopTaskIntentImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UpdateProgressIntentImpl _$$UpdateProgressIntentImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProgressIntentImpl(
      timeMillis: (json['timeMillis'] as num).toInt(),
      distanceMeters: (json['distanceMeters'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UpdateProgressIntentImplToJson(
        _$UpdateProgressIntentImpl instance) =>
    <String, dynamic>{
      'timeMillis': instance.timeMillis,
      'distanceMeters': instance.distanceMeters,
      'runtimeType': instance.$type,
    };
