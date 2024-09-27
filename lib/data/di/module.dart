import 'package:get_it/get_it.dart';
import 'package:run_tracker/data/geolocator/di/module.dart';
import 'package:run_tracker/data/metrics/di/module.dart';
import 'package:run_tracker/data/session/di/module.dart';

extension DataModule on GetIt {
  void registerDataModule() {
    registerGeolocatorModule();
    registerMetricsModule();
    registerSessionModule();
  }
}
