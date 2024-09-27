import 'dart:math';
import 'package:run_tracker/domain/metrics/checkpoint.dart';
import 'package:run_tracker/domain/metrics/interactor.dart';

const _earthRadiusMeters = 6371000.0;

final class MetricsInteractorImpl extends MetricsInteractor {
  @override
  double distance({
    required Checkpoint p1,
    required Checkpoint p2,
  }) {
    final dLat = _degreesToRadians(degrees: p2.latitude - p1.latitude);
    final dLng = _degreesToRadians(degrees: p2.longitude - p1.longitude);

    final dLat1 = _degreesToRadians(degrees: p1.latitude);
    final dLat2 = _degreesToRadians(degrees: p2.latitude);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLng / 2) * sin(dLng / 2) * cos(dLat1) * cos(dLat2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return _earthRadiusMeters * c;
  }

  @override
  double speed({
    required Checkpoint p1,
    required Checkpoint p2,
  }) {
    final s = distance(p1: p1, p2: p2);
    final t = p2.timestampMs - p1.timestampMs;
    return s / t;
  }

  double _degreesToRadians({required double degrees}) => degrees / 180 * pi;
}
