import 'package:latlong2/latlong.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';

extension Coords on SprintState {
  LatLng? get coordinates => currentPosition == null
      ? null
      : LatLng(currentPosition!.latitude, currentPosition!.longitude);
}
