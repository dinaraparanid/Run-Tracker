import 'dart:convert';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/geolocator/service.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';
import 'package:run_tracker/feature/sprint/provider/coords.dart';
import 'package:run_tracker/feature/sprint/provider/session_state.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';
import 'package:run_tracker/system/sprint/intent.dart';
import 'package:run_tracker/system/sprint/interactor.dart';

const _initialZoom = 18.0;
const _minZoom = 15.0;
const _maxZoom = 20.0;

final sprintNotifierProvider = StateNotifierProvider<SprintNotifier, SprintState>(
  (ref) {
    final service = ref.watch(geolocatorServiceProvider);
    final taskInteractor = ref.watch(sprintTaskInteractorProvider);
    return SprintNotifier(service, taskInteractor);
  }
);

final class SprintNotifier extends StateNotifier<SprintState> {
  final GeolocatorService _geolocatorService;
  final SprintTaskInteractor _taskInteractor;
  final mapController = MapController();

  late String _notificationTitle;
  late String _notificationText;
  late String _pauseButtonTitle;
  late String _resumeButtonTitle;
  late String _stopButtonTitle;
  late String Function(double meters) _distanceFormatter;

  SprintNotifier(this._geolocatorService, this._taskInteractor) : super(
    const SprintState(zoom: _initialZoom)
  ) {
    _subscribeOnPositionUpdates();
  }

  static void _sprintActionReceiver({
    required Object intent,
    required SprintTaskInteractor taskInteractor,
    required String notificationTitle,
    required String notificationText,
    required String pauseButtonTitle,
    required String resumeButtonTitle,
    required String stopButtonTitle,
    required void Function(SprintTaskIntent) updateState,
  }) {
    final parsedIntent = SprintTaskIntent.fromJson(jsonDecode(intent as String));
    print('BIBA $parsedIntent');

    switch (parsedIntent) {
      case PauseTaskIntent():
        updateState(parsedIntent);
        taskInteractor.pauseSprint(
          notificationTitle: notificationTitle,
          notificationText: notificationText,
          resumeButtonTitle: resumeButtonTitle,
          stopButtonTitle: stopButtonTitle,
        );

      case ResumeTaskIntent():
        updateState(parsedIntent);
        taskInteractor.resumeSprint(
          notificationTitle: notificationTitle,
          notificationText: notificationText,
          pauseButtonTitle: pauseButtonTitle,
          stopButtonTitle: stopButtonTitle,
        );

      case StopTaskIntent():
        updateState(parsedIntent);
        taskInteractor.stopSprint(
          notificationTitle: notificationTitle,
          notificationText: notificationText,
        );

      case UpdateProgressIntent():
        updateState(parsedIntent);
    }
  }

  void _sprintActionReceiverImpl(Object intent) => _sprintActionReceiver(
    intent: intent,
    taskInteractor: _taskInteractor,
    notificationTitle: _notificationTitle,
    notificationText: _notificationText,
    pauseButtonTitle: _pauseButtonTitle,
    resumeButtonTitle: _resumeButtonTitle,
    stopButtonTitle: _stopButtonTitle,
    updateState: (intent) => state = switch (intent) {
      PauseTaskIntent() => state.copyWith(sessionState: SessionState.paused),
      ResumeTaskIntent() => state.copyWith(sessionState: SessionState.active),
      StopTaskIntent() => state.copyWith(sessionState: SessionState.finished),
      UpdateProgressIntent() => state.copyWith(
        sprintTime: Duration(milliseconds: intent.timeMillis),
        distance: _distanceFormatter(intent.distanceMeters),
      ),
    },
  );

  void _subscribeOnPositionUpdates() async =>
    (await _geolocatorService.currentPositionStream).fold(
      (e) => state = state.copyWith(error: e),
      (stream) => stream.listen(
        (position) => state = state.copyWith(currentPosition: position),
      ),
    );

  void _initNotificationLocals({
    required String notificationTitle,
    required String notificationText,
    required String pauseButtonTitle,
    required String resumeButtonTitle,
    required String stopButtonTitle,
    required String Function(double meters) distanceFormatter,
  }) {
    _notificationTitle = notificationTitle;
    _notificationText = notificationText;
    _pauseButtonTitle = pauseButtonTitle;
    _resumeButtonTitle = resumeButtonTitle;
    _stopButtonTitle = stopButtonTitle;
    _distanceFormatter = distanceFormatter;
  }

  void zoomIn() {
    state = state.copyWith(zoom: min(state.zoom + 1, _maxZoom));
    _moveToCurrentPosition();
  }

  void zoomOut() {
    state = state.copyWith(zoom: max(state.zoom - 1, _minZoom));
    _moveToCurrentPosition();
  }

  void _moveToCurrentPosition() =>
      mapController.move(state.coordinates!, state.zoom);

  Future<bool> tryRequestPermissions() async {
    final res = await FlutterForegroundTask.requestNotificationPermission();
    return res == NotificationPermission.granted;
  }

  void openAppSettings() => AppSettings.openAppSettings(asAnotherTask: true);

  Future<void> onSprintStart({
    required String notificationTitle,
    required String notificationText,
    required String pauseButtonTitle,
    required String resumeButtonTitle,
    required String stopButtonTitle,
    required String Function(double meters) distanceFormatter,
  }) async {
    _initNotificationLocals(
      notificationTitle: notificationTitle,
      notificationText: notificationText,
      pauseButtonTitle: pauseButtonTitle,
      resumeButtonTitle: resumeButtonTitle,
      stopButtonTitle: stopButtonTitle,
      distanceFormatter: distanceFormatter,
    );

    _taskInteractor
      ..initService()
      ..registerReceiver(_sprintActionReceiverImpl);

    state = state.copyWith(sessionState: SessionState.active);

    await _taskInteractor.startService(
      notificationTitle: notificationTitle,
      notificationText: notificationText,
      pauseButtonTitle: pauseButtonTitle,
      stopButtonTitle: stopButtonTitle,
    );
  }

  Future<void> onSprintPaused() async {
    await _taskInteractor.pauseSprint(
      notificationTitle: _notificationTitle,
      notificationText: _notificationText,
      resumeButtonTitle: _resumeButtonTitle,
      stopButtonTitle: _stopButtonTitle,
    );

    state = state.copyWith(sessionState: SessionState.paused);
  }

  Future<void> onSprintResumed() async {
    await _taskInteractor.resumeSprint(
      notificationTitle: _notificationTitle,
      notificationText: _notificationText,
      pauseButtonTitle: _pauseButtonTitle,
      stopButtonTitle: _stopButtonTitle,
    );

    state = state.copyWith(sessionState: SessionState.active);
  }

  Future<void> onSprintStopped() async {
    await _taskInteractor.stopSprint(
      notificationTitle: _notificationTitle,
      notificationText: _notificationText,
    );

    state = state.copyWith(sessionState: SessionState.finished);
  }

  void onBackClicked() {
    // TODO: show dialog
  }

  @override
  void dispose() async {
    _taskInteractor.unregisterReceiver(_sprintActionReceiverImpl);

    await _taskInteractor.stopSprint(
      notificationTitle: _notificationTitle,
      notificationText: _notificationText,
    );

    super.dispose();
  }
}
