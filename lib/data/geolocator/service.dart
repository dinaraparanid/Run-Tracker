import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';
import 'package:universal_platform/universal_platform.dart';

const _positionUpdateDuration = Duration(seconds: 1);

final geolocatorServiceProvider = Provider<GeolocatorService>(
  (ref) => GetIt.instance<GeolocatorService>()
);

final class GeolocatorServiceImpl extends GeolocatorService {
  @override
  Future<Either<GeolocatorError, Stream<Position>>> get currentPositionStream async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Either.left(NotEnabled());
    }

    return switch (await Geolocator.checkPermission()) {
      LocationPermission.denied => await onInitiallyDenied(),
      LocationPermission.deniedForever => denied,
      _ => positionStream,
    };
  }

  Future<Either<GeolocatorError, Stream<Position>>> onInitiallyDenied() async =>
      await Geolocator.requestPermission() == LocationPermission.denied
          ? denied : positionStream;

  Either<GeolocatorError, Stream<Position>> get denied =>
      Either.left(NotPermitted());

  Either<GeolocatorError, Stream<Position>> get positionStream {
    final settings = UniversalPlatform.isIOS
        ? AppleSettings(
            accuracy: LocationAccuracy.best,
            activityType: ActivityType.fitness,
        )
        : AndroidSettings(
            accuracy: LocationAccuracy.best,
            intervalDuration: _positionUpdateDuration,
        );

    return Either.right(Geolocator.getPositionStream(locationSettings: settings));
  }
}
