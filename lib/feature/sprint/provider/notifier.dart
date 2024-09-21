import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/geolocator/service.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';

final sprintNotifierProvider = StateNotifierProvider<SprintNotifier, SprintState>(
  (ref) {
    final service = ref.watch(geolocatorServiceProvider);
    return SprintNotifier(service);
  }
);

class SprintNotifier extends StateNotifier<SprintState> {
  final GeolocatorService _geolocatorService;

  SprintNotifier(this._geolocatorService) : super(const SprintState()) {
    _subscribeOnPositionUpdates();
  }

  void _subscribeOnPositionUpdates() async =>
    (await _geolocatorService.currentPositionStream()).fold(
      (e) => state = state.copyWith(error: e),
      (stream) => stream.listen(
        (position) => state = state.copyWith(currentPosition: position),
      ),
    );

  void onBackClicked() {
    // TODO: show dialog
  }
}
