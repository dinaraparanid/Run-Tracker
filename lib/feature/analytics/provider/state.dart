import 'package:run_tracker/domain/session/session.dart';

final class SessionAnalyticsState {
  final List<Session> sessions;

  late double totalDistanceKm;
  late String formattedTotalDistance;

  late Duration totalDuration;
  late String formattedTotalDuration;

  late double avgPace;
  late String formattedAvgPace;

  SessionAnalyticsState({required this.sessions}) {
    totalDistanceKm = sessions.totalDistance / 1000;
    totalDuration = sessions.totalDuration;
    avgPace = _averagePace(totalDistanceKm, totalDuration);
    formattedTotalDistance = _formattedTotalDistance(totalDistanceKm);
    formattedTotalDuration = _formattedTotalHours(totalDuration);
    formattedAvgPace = _formattedAveragePace(avgPace);
  }
}

extension _Properties on List<Session> {
  double get totalDistance =>
      fold(0.0, (sum, session) => sum + session.distance);

  Duration get totalDuration =>
      fold(Duration.zero, (sum, session) => sum + session.duration);
}

double _averagePace(double totalDistance, Duration totalDuration) =>
    (totalDistance > 0 && totalDuration.inSeconds > 0)
        ? (totalDistance / (totalDuration.inSeconds / 3600)).toDouble()
        : 0.0;

String _formattedTotalDistance(double totalDistance) =>
    totalDistance.toStringAsFixed(1);

String _formattedTotalHours(Duration totalDuration) {
  final hours = totalDuration.inHours;
  final minutes = totalDuration.inMinutes.remainder(60);
  final totalTime = hours + minutes / 60.0;
  return totalTime.toStringAsFixed(1);
}

String _formattedAveragePace(double avgPace) =>
    avgPace.toStringAsFixed(1);
