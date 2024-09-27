// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Checkpoint _$CheckpointFromJson(Map<String, dynamic> json) {
  return _Checkpoint.fromJson(json);
}

/// @nodoc
mixin _$Checkpoint {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get timestampMs => throw _privateConstructorUsedError;

  /// Serializes this Checkpoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Checkpoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckpointCopyWith<Checkpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckpointCopyWith<$Res> {
  factory $CheckpointCopyWith(
          Checkpoint value, $Res Function(Checkpoint) then) =
      _$CheckpointCopyWithImpl<$Res, Checkpoint>;
  @useResult
  $Res call({double latitude, double longitude, int timestampMs});
}

/// @nodoc
class _$CheckpointCopyWithImpl<$Res, $Val extends Checkpoint>
    implements $CheckpointCopyWith<$Res> {
  _$CheckpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Checkpoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestampMs = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestampMs: null == timestampMs
          ? _value.timestampMs
          : timestampMs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckpointImplCopyWith<$Res>
    implements $CheckpointCopyWith<$Res> {
  factory _$$CheckpointImplCopyWith(
          _$CheckpointImpl value, $Res Function(_$CheckpointImpl) then) =
      __$$CheckpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, int timestampMs});
}

/// @nodoc
class __$$CheckpointImplCopyWithImpl<$Res>
    extends _$CheckpointCopyWithImpl<$Res, _$CheckpointImpl>
    implements _$$CheckpointImplCopyWith<$Res> {
  __$$CheckpointImplCopyWithImpl(
      _$CheckpointImpl _value, $Res Function(_$CheckpointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Checkpoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestampMs = null,
  }) {
    return _then(_$CheckpointImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestampMs: null == timestampMs
          ? _value.timestampMs
          : timestampMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckpointImpl implements _Checkpoint {
  const _$CheckpointImpl(
      {required this.latitude,
      required this.longitude,
      required this.timestampMs});

  factory _$CheckpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckpointImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int timestampMs;

  @override
  String toString() {
    return 'Checkpoint(latitude: $latitude, longitude: $longitude, timestampMs: $timestampMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckpointImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestampMs, timestampMs) ||
                other.timestampMs == timestampMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, timestampMs);

  /// Create a copy of Checkpoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckpointImplCopyWith<_$CheckpointImpl> get copyWith =>
      __$$CheckpointImplCopyWithImpl<_$CheckpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckpointImplToJson(
      this,
    );
  }
}

abstract class _Checkpoint implements Checkpoint {
  const factory _Checkpoint(
      {required final double latitude,
      required final double longitude,
      required final int timestampMs}) = _$CheckpointImpl;

  factory _Checkpoint.fromJson(Map<String, dynamic> json) =
      _$CheckpointImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get timestampMs;

  /// Create a copy of Checkpoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckpointImplCopyWith<_$CheckpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
