import 'package:run_tracker/domain/session/session.dart';

abstract class SessionRepository {
  Future<void> subscribeOnPositionChanges();

  Future<List<Session>> loadSessions();
  Future<void> storeSession(Session session);

  Future<Session> getCurrentSession();
  Future<void> updateCurrentSession(Session session);
  Future<void> clearCurrentSession();
}