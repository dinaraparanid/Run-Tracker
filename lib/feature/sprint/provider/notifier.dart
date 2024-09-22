import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/geolocator/service.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';
import 'package:run_tracker/feature/sprint/provider/coords.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';

const _initialZoom = 18.0;
const _minZoom = 15.0;
const _maxZoom = 20.0;

final sprintNotifierProvider = StateNotifierProvider<SprintNotifier, SprintState>(
  (ref) {
    final service = ref.watch(geolocatorServiceProvider);
    return SprintNotifier(service);
  }
);

final class SprintNotifier extends StateNotifier<SprintState> {
  final GeolocatorService _geolocatorService;
  final mapController = MapController();

  SprintNotifier(this._geolocatorService) : super(
    const SprintState(zoom: _initialZoom)
  ) {
    _subscribeOnPositionUpdates();
  }

  void _subscribeOnPositionUpdates() async =>
    (await _geolocatorService.currentPositionStream()).fold(
      (e) => state = state.copyWith(error: e),
      (stream) => stream.listen(
        (position) => state = state.copyWith(currentPosition: position),
      ),
    );

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

  void onBackClicked() {
    // TODO: show dialog
  }

  void onStart() {
    // TODO: start session
  }
}
