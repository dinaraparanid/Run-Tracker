import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/session/repository.dart';
import 'package:run_tracker/domain/session/repository.dart';

final recordsProvider = StateNotifierProvider<RecordsNotifier, Records>(
  (ref) => RecordsNotifier(ref.watch(sessionRepositoryProvider)),
);

final class Records {
  final double maxDistance;
  final String maxDistanceDate;
  final double bestPace;
  final String bestPaceDate;
  final double maxDuration;
  final String maxDurationDate;

  Records({
    this.maxDistance = 0,
    this.maxDistanceDate = '',
    this.bestPace = 0,
    this.bestPaceDate = '',
    this.maxDuration = 0,
    this.maxDurationDate = '',
  });
}

final class RecordsNotifier extends StateNotifier<Records> {
  final SessionRepository _repository;

  RecordsNotifier(this._repository) : super(Records());

  Future<void> loadRecords() async {
    final sessions = await _repository.loadSessions();

    double maxDistance = 0;
    double bestPace = double.infinity;
    double maxDuration = 0;
    String maxDistanceDate = '';
    String bestPaceDate = '';
    String maxDurationDate = '';

    for (final session in sessions) {
      if (session.distance > maxDistance) {
        maxDistance = session.distance.toDouble();
        maxDistanceDate = session.date.toString();
      }

      if (session.duration.inMinutes > 0) {
        final pace = session.distance / session.duration.inMinutes;
        if (pace < bestPace) {
          bestPace = pace;
          bestPaceDate = session.date.toString();
        }
      }

      final durationInHours = session.duration.inHours + session.duration.inMinutes / 60.0;
      if (durationInHours > maxDuration) {
        maxDuration = durationInHours;
        maxDurationDate = session.date.toString();
      }
    }

    state = Records(
      maxDistance: maxDistance,
      maxDistanceDate: maxDistanceDate.isNotEmpty ? maxDistanceDate : 'kmk',
      bestPace: bestPace.isFinite ? bestPace : 0,
      bestPaceDate: bestPace.isFinite ? bestPaceDate : '',
      maxDuration: maxDuration / 60.0,
      maxDurationDate: maxDurationDate.isNotEmpty ? maxDurationDate : '',
    );
  }
}