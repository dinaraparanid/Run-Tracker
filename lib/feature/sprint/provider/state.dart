import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';

part 'state.freezed.dart';

@freezed
abstract class SprintState with _$SprintState {
  const factory SprintState({
    required double zoom,
    Position? currentPosition,
    GeolocatorError? error,
  }) = _SprintState;
}
