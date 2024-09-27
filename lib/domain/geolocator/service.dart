import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:run_tracker/domain/geolocator/error.dart';

abstract class GeolocatorService {
  Future<Either<GeolocatorError, Stream<Position>>> get currentPositionStream;
}
