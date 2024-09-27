import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/feature/ready_steady_go/provider/back_result.dart';
import 'package:run_tracker/feature/ready_steady_go/provider/state.dart';

const _maxCountdown = 3;
const _minCountdown = 1;

final readySteadyGoProvider = StateNotifierProvider.autoDispose<ReadySteadyGoNotifier, ReadySteadyGoState>(
  (ref) => ReadySteadyGoNotifier()
);

final class ReadySteadyGoNotifier extends StateNotifier<ReadySteadyGoState> {
  late Timer _countdownTimer;

  ReadySteadyGoNotifier() : super(
    const ReadySteadyGoState(countdown: _maxCountdown)
  ) {
    _countdownTimer = _buildTimer();
  }

  Timer _buildTimer() => Timer.periodic(
    const Duration(seconds: 1),
    (timer) => state = state.copyWith(
      countdown: max(state.countdown - 1, _minCountdown),
    )
  );

  void onCountdownFinished(BuildContext context) =>
    Navigator.pop(context, LaunchSprint());

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }
}
