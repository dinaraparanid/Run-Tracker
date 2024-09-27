import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:run_tracker/data/hive/entity.dart';
import 'package:run_tracker/domain/mod.dart';
import 'package:run_tracker/domain/session/repository.dart';
import 'package:run_tracker/domain/session/session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

const _currentSessionKey = 'current_session';

final sessionRepositoryProvider = Provider(
  (ref) => GetIt.instance<SessionRepository>()
);

final class SessionRepositoryImpl extends SessionRepository {
  final GeolocatorService geolocatorService;

  SessionRepositoryImpl(this.geolocatorService);

  @override
  Future<void> subscribeOnPositionChanges() async {
    (await geolocatorService.currentPositionStream).fold(
      (_) {}, // do nothing on error
      (stream) => stream.listen((position) async {
        final geolocationData = GeolocationDataEntity.fromPosition(position);
        final box = await Hive.openBox<GeolocationDataEntity>('geolocationData');
        box.add(geolocationData);
      })
    );
  }

  @override
  Future<List<Session>> loadSessions() async =>
    (await Hive.openBox<SessionEntity>('sessions'))
      .values
        .map((entity) => Session(
          id: entity.id,
          date: entity.date,
          distance: entity.distance,
          duration: Duration(milliseconds: entity.duration),
          checkpoints: [],
        ))
        .toList(growable: false);

  @override
  Future<void> storeSession(Session session) async {
    final box = await Hive.openBox<SessionEntity>('sessions');

    final entity = SessionEntity(
      id: session.id,
      date: session.date,
      distance: session.distance,
      duration: session.duration.inMilliseconds,
    );

    await box.put(session.id, entity);
  }

  @override
  Future<Session> getCurrentSession() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_currentSessionKey);

    return value == null
      ? Session.create(date: DateTime.now())
      : Session.fromJson(jsonDecode(value));
  }

  @override
  Future<void> updateCurrentSession(Session session) async {
    final prefs = await StreamingSharedPreferences.instance;
    await prefs.setString(_currentSessionKey, jsonEncode(session.toJson()));
  }

  @override
  Future<void> clearCurrentSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentSessionKey);
  }
}
