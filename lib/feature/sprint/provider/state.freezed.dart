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
  Position? get currentPosition => throw _privateConstructorUsedError;
  GeolocatorError? get error => throw _privateConstructorUsedError;

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
  $Res call({Position? currentPosition, GeolocatorError? error});
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
    Object? currentPosition = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GeolocatorError?,
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
  $Res call({Position? currentPosition, GeolocatorError? error});
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
    Object? currentPosition = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SprintStateImpl(
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as GeolocatorError?,
    ));
  }
}

/// @nodoc

class _$SprintStateImpl implements _SprintState {
  const _$SprintStateImpl({this.currentPosition, this.error});

  @override
  final Position? currentPosition;
  @override
  final GeolocatorError? error;

  @override
  String toString() {
    return 'SprintState(currentPosition: $currentPosition, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SprintStateImpl &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPosition, error);

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
      {final Position? currentPosition,
      final GeolocatorError? error}) = _$SprintStateImpl;

  @override
  Position? get currentPosition;
  @override
  GeolocatorError? get error;

  /// Create a copy of SprintState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SprintStateImplCopyWith<_$SprintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
