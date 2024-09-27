import 'package:flutter/cupertino.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:run_tracker/app.dart';
import 'package:run_tracker/data/hive/entity.dart';
import 'package:run_tracker/data/hive/hive.dart';
import 'package:run_tracker/di/app_module.dart';

void _initDI() => di.registerAppModule();

Future<void> _prepareHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
}

void _initForegroundTasks() =>
    FlutterForegroundTask.initCommunicationPort();

void main() async {
  _initDI();
  await _prepareHive();
  _initForegroundTasks();
  runApp(const ProviderScope(child: App()));
}