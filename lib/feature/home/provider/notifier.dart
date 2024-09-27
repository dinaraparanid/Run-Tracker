import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/session/repository.dart';
import 'package:run_tracker/domain/session/repository.dart';
import 'package:run_tracker/domain/session/session.dart';

final sessionProvider = StateNotifierProvider<SessionNotifier, List<Session>>(
  (ref) => SessionNotifier(ref.watch(sessionRepositoryProvider)),
);

final class SessionNotifier extends StateNotifier<List<Session>> {
  final SessionRepository _repository;

  SessionNotifier(this._repository) : super([]) {
    loadSessions();
  }

  Future<void> loadSessions() async =>
    state = await _repository.loadSessions();
}
