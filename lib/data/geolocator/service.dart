import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:run_tracker/domain/geolocator/mod.dart';

final geolocatorServiceProvider = Provider<GeolocatorService>(
  (ref) => _GeolocatorServiceImpl()
);

final class _GeolocatorServiceImpl extends GeolocatorService {
  @override
  Future<Either<GeolocatorError, Stream<Position>>> currentPositionStream() async {
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

  Either<GeolocatorError, Stream<Position>> get positionStream =>
      Either.right(Geolocator.getPositionStream());
}
