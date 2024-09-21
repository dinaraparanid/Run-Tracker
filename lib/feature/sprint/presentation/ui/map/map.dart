import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/map/marker.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/map/zoom_buttons.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';

const _mapOffset = 5.0;
const _initialZoom = 18.0;
const _positionMarkerSize = 16.0;

final _mapTileLayer = TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);

final class SprintMap extends ConsumerWidget {

  const SprintMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(sprintNotifierProvider);
    final notifier = ref.read(sprintNotifierProvider.notifier);
    final position = state.currentPosition;

    if (position == null) {
      return mapStub(indicatorColor: theme.colors.indicator.primary);
    }

    final lat = position.latitude;
    final lng = position.longitude;

    return FlutterMap(
      mapController: notifier.mapController,
      options: MapOptions(
        initialCenter: LatLng(lat, lng),
        initialZoom: state.zoom,
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds(
            LatLng(lat - _mapOffset, lng - _mapOffset),
            LatLng(lat + _mapOffset, lng + _mapOffset),
          ),
        ),
      ),
      children: [
        _mapTileLayer,
        MarkerLayer(markers: [positionMarker(latitude: lat, longitude: lng)]),
        const SprintMapZoomButtons(),
      ],
    );
  }

  Widget mapStub({required Color indicatorColor}) => Container(
    alignment: Alignment.center,
    child: CircularProgressIndicator(color: indicatorColor),
  );

  Marker positionMarker({
    required double latitude,
    required double longitude,
  }) => Marker(
      point: LatLng(latitude, longitude),
      width: _positionMarkerSize,
      height: _positionMarkerSize,
      child: const SprintMarker()
  );
}
