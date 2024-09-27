import 'dart:async';
import 'dart:convert';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:run_tracker/data/geolocator/service.dart';
import 'package:run_tracker/data/hive/hive.dart';
import 'package:run_tracker/data/metrics/interactor.dart';
import 'package:run_tracker/data/session/repository.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';
import 'package:run_tracker/domain/metrics/checkpoint.dart';
import 'package:run_tracker/domain/metrics/interactor.dart';
import 'package:run_tracker/domain/session/repository.dart';
import 'package:run_tracker/domain/session/session.dart';
import 'package:run_tracker/system/sprint/intent.dart';
import 'package:run_tracker/system/sprint/interactor.dart';

const _updateUiPeriod = Duration(seconds: 1);

@pragma('vm:entry-point')
void startSprintTaskCallback() => _launchService(_StartState());

@pragma('vm:entry-point')
void pauseSprintTaskCallback() => _launchService(_PauseState());

@pragma('vm:entry-point')
void resumeSprintTaskCallback() => _launchService(_ResumeState());

@pragma('vm:entry-point')
void stopSprintTaskCallback() => _launchService(_StopState());

void _launchService(_SprintTaskHandlerState state) async {
  // TODO: Dependency injection
  final geolocatorService = GeolocatorServiceImpl();
  final metricsInteractor = MetricsInteractorImpl();
  final sessionRepository = SessionRepositoryImpl(geolocatorService);

  await initHive();

  FlutterForegroundTask.setTaskHandler(SprintTaskHandler._(
    state,
    geolocatorService,
    metricsInteractor,
    sessionRepository,
  ));
}

sealed class _SprintTaskHandlerState {}
final class _StartState extends _SprintTaskHandlerState {}
final class _PauseState extends _SprintTaskHandlerState {}
final class _ResumeState extends _SprintTaskHandlerState {}
final class _StopState extends _SprintTaskHandlerState {}

final _sprintStopwatch = Stopwatch();

final class SprintTaskHandler extends TaskHandler {
  final _SprintTaskHandlerState _state;
  final GeolocatorService _geolocatorService;
  final MetricsInteractor _metricsInteractor;
  final SessionRepository _sessionRepository;

  Timer? _sprintBroadcastTimer;
  late Session _currentSession;
  late Duration _initialDuration;

  SprintTaskHandler._(
    this._state,
    this._geolocatorService,
    this._metricsInteractor,
    this._sessionRepository,
  );

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    _currentSession = await _sessionRepository.getCurrentSession();
    _initialDuration = _currentSession.duration;
    print('BIBA START');

    switch (_state) {
      case _StartState(): _continueSprint();
      case _PauseState(): _pauseSprint();
      case _ResumeState(): _continueSprint();
      case _StopState(): await _stopSprint();
    }
  }

  @override
  void onNotificationButtonPressed(String id) {
    final intent = switch (id) {
      SprintTaskInteractor.pauseButtonId => const PauseTaskIntent(),
      SprintTaskInteractor.resumeButtonId => const ResumeTaskIntent(),
      SprintTaskInteractor.stopButtonId => const StopTaskIntent(),
      _ => throw UnsupportedError('Illegal button id'),
    };

    FlutterForegroundTask.sendDataToMain(jsonEncode(intent.toJson()));
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async =>
    _disposeTimer();

  @override
  void onRepeatEvent(DateTime timestamp) {}

  void _continueSprint() {
    _sprintStopwatch.start();
    _subscribeOnPositionUpdates();
    print('BIBA CONTINUE SPRINT');

    _sprintBroadcastTimer = Timer.periodic(
      _updateUiPeriod,
      (timer) {
        final newDuration = _initialDuration + Duration(
          milliseconds: _sprintStopwatch.elapsedMilliseconds,
        );

        _currentSession = _currentSession.copyWith(duration: newDuration);
        _sessionRepository.updateCurrentSession(_currentSession);

        final intent = UpdateProgressIntent(
          timeMillis: newDuration.inMilliseconds,
          distanceMeters: _currentSession.distance,
        );

        FlutterForegroundTask.sendDataToMain(jsonEncode(intent.toJson()));
      },
    );
  }

  void _subscribeOnPositionUpdates() async {
    final stream = await _geolocatorService.currentPositionStream;

    stream.toNullable()?.listen((pos) async {
      final newCheckpoint = Checkpoint(
        latitude: pos.latitude,
        longitude: pos.longitude,
        timestampMs: _sprintStopwatch.elapsedMilliseconds,
      );

      final lastCheckpoint = _currentSession.checkpoints.lastOrNull;

      final distFromLastPoint = lastCheckpoint == null
          ? 0.0
          : _metricsInteractor.distance(p1: lastCheckpoint, p2: newCheckpoint);

      final distance = _currentSession.distance + distFromLastPoint;

      final checkpoints = [..._currentSession.checkpoints, newCheckpoint];

      _currentSession = _currentSession.copyWith(
        distance: distance,
        duration: Duration(milliseconds: _sprintStopwatch.elapsedMilliseconds),
        checkpoints: checkpoints,
      );

      _sessionRepository.updateCurrentSession(_currentSession);
    });
  }

  void _pauseSprint() => _sprintStopwatch.stop();

  Future<void> _stopSprint() async {
    _sprintStopwatch.reset();
    _sessionRepository.storeSession(_currentSession);
    _sessionRepository.clearCurrentSession();
    await FlutterForegroundTask.stopService();
  }

  void _disposeTimer() {
    _sprintBroadcastTimer?.cancel();
    _sprintBroadcastTimer = null;
  }
}
