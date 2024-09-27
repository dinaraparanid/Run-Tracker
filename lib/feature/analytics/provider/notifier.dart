import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/session/repository.dart';
import 'package:run_tracker/domain/session/repository.dart';
import 'package:run_tracker/feature/analytics/provider/state.dart';

final sessionAnalyticsProvider = StateNotifierProvider<SessionAnalyticsNotifier, SessionAnalyticsState>(
  (ref) => SessionAnalyticsNotifier(ref.watch(sessionRepositoryProvider)),
);

final class SessionAnalyticsNotifier extends StateNotifier<SessionAnalyticsState> {
  final SessionRepository _repository;

  SessionAnalyticsNotifier(this._repository) : super(SessionAnalyticsState(sessions: [])) {
    loadSessions();
  }

  Future<void> loadSessions() async =>
      state = SessionAnalyticsState(sessions: await _repository.loadSessions());
}
