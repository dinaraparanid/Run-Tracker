// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SprintTaskIntent _$SprintTaskIntentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pause':
      return PauseTaskIntent.fromJson(json);
    case 'resume':
      return ResumeTaskIntent.fromJson(json);
    case 'stop':
      return StopTaskIntent.fromJson(json);
    case 'updateProgress':
      return UpdateProgressIntent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SprintTaskIntent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SprintTaskIntent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function(int timeMillis, double distanceMeters)
        updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function(int timeMillis, double distanceMeters)? updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function(int timeMillis, double distanceMeters)? updateProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseTaskIntent value) pause,
    required TResult Function(ResumeTaskIntent value) resume,
    required TResult Function(StopTaskIntent value) stop,
    required TResult Function(UpdateProgressIntent value) updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseTaskIntent value)? pause,
    TResult? Function(ResumeTaskIntent value)? resume,
    TResult? Function(StopTaskIntent value)? stop,
    TResult? Function(UpdateProgressIntent value)? updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseTaskIntent value)? pause,
    TResult Function(ResumeTaskIntent value)? resume,
    TResult Function(StopTaskIntent value)? stop,
    TResult Function(UpdateProgressIntent value)? updateProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this SprintTaskIntent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SprintTaskIntentCopyWith<$Res> {
  factory $SprintTaskIntentCopyWith(
          SprintTaskIntent value, $Res Function(SprintTaskIntent) then) =
      _$SprintTaskIntentCopyWithImpl<$Res, SprintTaskIntent>;
}

/// @nodoc
class _$SprintTaskIntentCopyWithImpl<$Res, $Val extends SprintTaskIntent>
    implements $SprintTaskIntentCopyWith<$Res> {
  _$SprintTaskIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PauseTaskIntentImplCopyWith<$Res> {
  factory _$$PauseTaskIntentImplCopyWith(_$PauseTaskIntentImpl value,
          $Res Function(_$PauseTaskIntentImpl) then) =
      __$$PauseTaskIntentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseTaskIntentImplCopyWithImpl<$Res>
    extends _$SprintTaskIntentCopyWithImpl<$Res, _$PauseTaskIntentImpl>
    implements _$$PauseTaskIntentImplCopyWith<$Res> {
  __$$PauseTaskIntentImplCopyWithImpl(
      _$PauseTaskIntentImpl _value, $Res Function(_$PauseTaskIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PauseTaskIntentImpl extends PauseTaskIntent {
  const _$PauseTaskIntentImpl({final String? $type})
      : $type = $type ?? 'pause',
        super._();

  factory _$PauseTaskIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PauseTaskIntentImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SprintTaskIntent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseTaskIntentImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function(int timeMillis, double distanceMeters)
        updateProgress,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function(int timeMillis, double distanceMeters)? updateProgress,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function(int timeMillis, double distanceMeters)? updateProgress,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseTaskIntent value) pause,
    required TResult Function(ResumeTaskIntent value) resume,
    required TResult Function(StopTaskIntent value) stop,
    required TResult Function(UpdateProgressIntent value) updateProgress,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseTaskIntent value)? pause,
    TResult? Function(ResumeTaskIntent value)? resume,
    TResult? Function(StopTaskIntent value)? stop,
    TResult? Function(UpdateProgressIntent value)? updateProgress,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseTaskIntent value)? pause,
    TResult Function(ResumeTaskIntent value)? resume,
    TResult Function(StopTaskIntent value)? stop,
    TResult Function(UpdateProgressIntent value)? updateProgress,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PauseTaskIntentImplToJson(
      this,
    );
  }
}

abstract class PauseTaskIntent extends SprintTaskIntent {
  const factory PauseTaskIntent() = _$PauseTaskIntentImpl;
  const PauseTaskIntent._() : super._();

  factory PauseTaskIntent.fromJson(Map<String, dynamic> json) =
      _$PauseTaskIntentImpl.fromJson;
}

/// @nodoc
abstract class _$$ResumeTaskIntentImplCopyWith<$Res> {
  factory _$$ResumeTaskIntentImplCopyWith(_$ResumeTaskIntentImpl value,
          $Res Function(_$ResumeTaskIntentImpl) then) =
      __$$ResumeTaskIntentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumeTaskIntentImplCopyWithImpl<$Res>
    extends _$SprintTaskIntentCopyWithImpl<$Res, _$ResumeTaskIntentImpl>
    implements _$$ResumeTaskIntentImplCopyWith<$Res> {
  __$$ResumeTaskIntentImplCopyWithImpl(_$ResumeTaskIntentImpl _value,
      $Res Function(_$ResumeTaskIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ResumeTaskIntentImpl extends ResumeTaskIntent {
  const _$ResumeTaskIntentImpl({final String? $type})
      : $type = $type ?? 'resume',
        super._();

  factory _$ResumeTaskIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeTaskIntentImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SprintTaskIntent.resume()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumeTaskIntentImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function(int timeMillis, double distanceMeters)
        updateProgress,
  }) {
    return resume();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function(int timeMillis, double distanceMeters)? updateProgress,
  }) {
    return resume?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function(int timeMillis, double distanceMeters)? updateProgress,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseTaskIntent value) pause,
    required TResult Function(ResumeTaskIntent value) resume,
    required TResult Function(StopTaskIntent value) stop,
    required TResult Function(UpdateProgressIntent value) updateProgress,
  }) {
    return resume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseTaskIntent value)? pause,
    TResult? Function(ResumeTaskIntent value)? resume,
    TResult? Function(StopTaskIntent value)? stop,
    TResult? Function(UpdateProgressIntent value)? updateProgress,
  }) {
    return resume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseTaskIntent value)? pause,
    TResult Function(ResumeTaskIntent value)? resume,
    TResult Function(StopTaskIntent value)? stop,
    TResult Function(UpdateProgressIntent value)? updateProgress,
    required TResult orElse(),
  }) {
    if (resume != null) {
      return resume(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeTaskIntentImplToJson(
      this,
    );
  }
}

abstract class ResumeTaskIntent extends SprintTaskIntent {
  const factory ResumeTaskIntent() = _$ResumeTaskIntentImpl;
  const ResumeTaskIntent._() : super._();

  factory ResumeTaskIntent.fromJson(Map<String, dynamic> json) =
      _$ResumeTaskIntentImpl.fromJson;
}

/// @nodoc
abstract class _$$StopTaskIntentImplCopyWith<$Res> {
  factory _$$StopTaskIntentImplCopyWith(_$StopTaskIntentImpl value,
          $Res Function(_$StopTaskIntentImpl) then) =
      __$$StopTaskIntentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopTaskIntentImplCopyWithImpl<$Res>
    extends _$SprintTaskIntentCopyWithImpl<$Res, _$StopTaskIntentImpl>
    implements _$$StopTaskIntentImplCopyWith<$Res> {
  __$$StopTaskIntentImplCopyWithImpl(
      _$StopTaskIntentImpl _value, $Res Function(_$StopTaskIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$StopTaskIntentImpl extends StopTaskIntent {
  const _$StopTaskIntentImpl({final String? $type})
      : $type = $type ?? 'stop',
        super._();

  factory _$StopTaskIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopTaskIntentImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SprintTaskIntent.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopTaskIntentImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function(int timeMillis, double distanceMeters)
        updateProgress,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function(int timeMillis, double distanceMeters)? updateProgress,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function(int timeMillis, double distanceMeters)? updateProgress,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseTaskIntent value) pause,
    required TResult Function(ResumeTaskIntent value) resume,
    required TResult Function(StopTaskIntent value) stop,
    required TResult Function(UpdateProgressIntent value) updateProgress,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseTaskIntent value)? pause,
    TResult? Function(ResumeTaskIntent value)? resume,
    TResult? Function(StopTaskIntent value)? stop,
    TResult? Function(UpdateProgressIntent value)? updateProgress,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseTaskIntent value)? pause,
    TResult Function(ResumeTaskIntent value)? resume,
    TResult Function(StopTaskIntent value)? stop,
    TResult Function(UpdateProgressIntent value)? updateProgress,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StopTaskIntentImplToJson(
      this,
    );
  }
}

abstract class StopTaskIntent extends SprintTaskIntent {
  const factory StopTaskIntent() = _$StopTaskIntentImpl;
  const StopTaskIntent._() : super._();

  factory StopTaskIntent.fromJson(Map<String, dynamic> json) =
      _$StopTaskIntentImpl.fromJson;
}

/// @nodoc
abstract class _$$UpdateProgressIntentImplCopyWith<$Res> {
  factory _$$UpdateProgressIntentImplCopyWith(_$UpdateProgressIntentImpl value,
          $Res Function(_$UpdateProgressIntentImpl) then) =
      __$$UpdateProgressIntentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int timeMillis, double distanceMeters});
}

/// @nodoc
class __$$UpdateProgressIntentImplCopyWithImpl<$Res>
    extends _$SprintTaskIntentCopyWithImpl<$Res, _$UpdateProgressIntentImpl>
    implements _$$UpdateProgressIntentImplCopyWith<$Res> {
  __$$UpdateProgressIntentImplCopyWithImpl(_$UpdateProgressIntentImpl _value,
      $Res Function(_$UpdateProgressIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeMillis = null,
    Object? distanceMeters = null,
  }) {
    return _then(_$UpdateProgressIntentImpl(
      timeMillis: null == timeMillis
          ? _value.timeMillis
          : timeMillis // ignore: cast_nullable_to_non_nullable
              as int,
      distanceMeters: null == distanceMeters
          ? _value.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProgressIntentImpl extends UpdateProgressIntent {
  const _$UpdateProgressIntentImpl(
      {required this.timeMillis,
      required this.distanceMeters,
      final String? $type})
      : $type = $type ?? 'updateProgress',
        super._();

  factory _$UpdateProgressIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProgressIntentImplFromJson(json);

  @override
  final int timeMillis;
  @override
  final double distanceMeters;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SprintTaskIntent.updateProgress(timeMillis: $timeMillis, distanceMeters: $distanceMeters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProgressIntentImpl &&
            (identical(other.timeMillis, timeMillis) ||
                other.timeMillis == timeMillis) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timeMillis, distanceMeters);

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProgressIntentImplCopyWith<_$UpdateProgressIntentImpl>
      get copyWith =>
          __$$UpdateProgressIntentImplCopyWithImpl<_$UpdateProgressIntentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pause,
    required TResult Function() resume,
    required TResult Function() stop,
    required TResult Function(int timeMillis, double distanceMeters)
        updateProgress,
  }) {
    return updateProgress(timeMillis, distanceMeters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pause,
    TResult? Function()? resume,
    TResult? Function()? stop,
    TResult? Function(int timeMillis, double distanceMeters)? updateProgress,
  }) {
    return updateProgress?.call(timeMillis, distanceMeters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pause,
    TResult Function()? resume,
    TResult Function()? stop,
    TResult Function(int timeMillis, double distanceMeters)? updateProgress,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(timeMillis, distanceMeters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PauseTaskIntent value) pause,
    required TResult Function(ResumeTaskIntent value) resume,
    required TResult Function(StopTaskIntent value) stop,
    required TResult Function(UpdateProgressIntent value) updateProgress,
  }) {
    return updateProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PauseTaskIntent value)? pause,
    TResult? Function(ResumeTaskIntent value)? resume,
    TResult? Function(StopTaskIntent value)? stop,
    TResult? Function(UpdateProgressIntent value)? updateProgress,
  }) {
    return updateProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PauseTaskIntent value)? pause,
    TResult Function(ResumeTaskIntent value)? resume,
    TResult Function(StopTaskIntent value)? stop,
    TResult Function(UpdateProgressIntent value)? updateProgress,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProgressIntentImplToJson(
      this,
    );
  }
}

abstract class UpdateProgressIntent extends SprintTaskIntent {
  const factory UpdateProgressIntent(
      {required final int timeMillis,
      required final double distanceMeters}) = _$UpdateProgressIntentImpl;
  const UpdateProgressIntent._() : super._();

  factory UpdateProgressIntent.fromJson(Map<String, dynamic> json) =
      _$UpdateProgressIntentImpl.fromJson;

  int get timeMillis;
  double get distanceMeters;

  /// Create a copy of SprintTaskIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProgressIntentImplCopyWith<_$UpdateProgressIntentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
