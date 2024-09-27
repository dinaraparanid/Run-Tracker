import 'package:hive_flutter/hive_flutter.dart';
import 'package:run_tracker/data/hive/duration_adapter.dart';
import 'package:run_tracker/data/hive/entity.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DurationAdapter(), override: true);
  Hive.registerAdapter(SessionEntityAdapter(), override: true);
  Hive.registerAdapter(GeolocationDataEntityAdapter(), override: true);
}
