// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SprintState {
  double get zoom => throw _privateConstructorUsedError;
  Position? get currentPosition => throw _privateConstructorUsedError;
  GeolocatorError? get error => throw _privateConstructorUsedError;
  SessionState? get sessionState => throw _privateConstructorUsedError;
  Duration? get sprintTime => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SprintStateCopyWith<SprintState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SprintStateCopyWith<$Res> {
  factory $SprintStateCopyWith(
          SprintState value, $Res Function(SprintState) then) =
      _$SprintStateCopyWithImpl<$Res, SprintState>;
  @useResult
  $Res call(
      {double zoom,
      Position? currentPosition,
      GeolocatorError? error,
      SessionState? sessionState,
      Duration? sprintTime,
      String? distance});
}

/// @nodoc
class _$SprintStateCopyWithImpl<$Res, $Val extends SprintState>
    implements $SprintStateCopyWith<$Res> {
  _$SprintStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoom = null,
    Object? currentPosition = freezed,
    Object? error = freezed,
    Object? sessionState = freezed,
    Object? sprintTime = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GeolocatorError?,
      sessionState: freezed == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as SessionState?,
      sprintTime: freezed == sprintTime
          ? _value.sprintTime
          : sprintTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SprintStateImplCopyWith<$Res>
    implements $SprintStateCopyWith<$Res> {
  factory _$$SprintStateImplCopyWith(
          _$SprintStateImpl value, $Res Function(_$SprintStateImpl) then) =
      __$$SprintStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double zoom,
      Position? currentPosition,
      GeolocatorError? error,
      SessionState? sessionState,
      Duration? sprintTime,
      String? distance});
}

/// @nodoc
class __$$SprintStateImplCopyWithImpl<$Res>
    extends _$SprintStateCopyWithImpl<$Res, _$SprintStateImpl>
    implements _$$SprintStateImplCopyWith<$Res> {
  __$$SprintStateImplCopyWithImpl(
      _$SprintStateImpl _value, $Res Function(_$SprintStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoom = null,
    Object? currentPosition = freezed,
    Object? error = freezed,
    Object? sessionState = freezed,
    Object? sprintTime = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$SprintStateImpl(
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as double,
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GeolocatorError?,
      sessionState: freezed == sessionState
          ? _value.sessionState
          : sessionState // ignore: cast_nullable_to_non_nullable
              as SessionState?,
      sprintTime: freezed == sprintTime
          ? _value.sprintTime
          : sprintTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SprintStateImpl implements _SprintState {
  const _$SprintStateImpl(
      {required this.zoom,
      this.currentPosition,
      this.error,
      this.sessionState,
      this.sprintTime,
      this.distance});

  @override
  final double zoom;
  @override
  final Position? currentPosition;
  @override
  final GeolocatorError? error;
  @override
  final SessionState? sessionState;
  @override
  final Duration? sprintTime;
  @override
  final String? distance;

  @override
  String toString() {
    return 'SprintState(zoom: $zoom, currentPosition: $currentPosition, error: $error, sessionState: $sessionState, sprintTime: $sprintTime, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SprintStateImpl &&
            (identical(other.zoom, zoom) || other.zoom == zoom) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.sessionState, sessionState) ||
                other.sessionState == sessionState) &&
            (identical(other.sprintTime, sprintTime) ||
                other.sprintTime == sprintTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zoom, currentPosition, error,
      sessionState, sprintTime, distance);

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SprintStateImplCopyWith<_$SprintStateImpl> get copyWith =>
      __$$SprintStateImplCopyWithImpl<_$SprintStateImpl>(this, _$identity);
}

abstract class _SprintState implements SprintState {
  const factory _SprintState(
      {required final double zoom,
      final Position? currentPosition,
      final GeolocatorError? error,
      final SessionState? sessionState,
      final Duration? sprintTime,
      final String? distance}) = _$SprintStateImpl;

  @override
  double get zoom;
  @override
  Position? get currentPosition;
  @override
  GeolocatorError? get error;
  @override
  SessionState? get sessionState;
  @override
  Duration? get sprintTime;
  @override
  String? get distance;

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SprintStateImplCopyWith<_$SprintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
