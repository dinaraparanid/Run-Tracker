import 'package:get_it/get_it.dart';
import 'package:run_tracker/data/geolocator/service.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';

extension GeolocatorModule on GetIt {
  void registerGeolocatorModule() =>
    registerLazySingleton<GeolocatorService>(() => GeolocatorServiceImpl());
}
