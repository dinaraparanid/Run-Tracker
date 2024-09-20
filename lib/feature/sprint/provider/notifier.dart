import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';

class SprintNotifier extends StateNotifier<SprintState> {
  SprintNotifier(super.state);

  void onBackClicked() {
    // TODO: show dialog
  }
}