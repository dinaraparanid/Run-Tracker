import 'package:run_tracker/feature/sprint/provider/state.dart';

extension Properties on SprintState {
  String get distanceFormatted => distance ?? '0.00';

  String get sprintTimeFormatted {
    final hoursFormatted = _twoDigits(sprintTime?.inHours ?? 0);
    final minutesFormatted = _twoDigits(sprintTime?.inMinutes.remainder(60).abs() ?? 0);
    final secondsFormatted = _twoDigits(sprintTime?.inSeconds.remainder(60).abs() ?? 0);
    return '$hoursFormatted:$minutesFormatted:$secondsFormatted';
  }

  String _twoDigits(int n) => n >= 10 ? '$n' : '0$n';
}
