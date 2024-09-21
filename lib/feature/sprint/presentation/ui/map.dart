import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';

const _mapOffset = 5.0;
const _initialZoom = 18.0;

class SprintMap extends ConsumerWidget {
  const SprintMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sprintNotifierProvider);
    final position = state.currentPosition;

    if (position == null) {
      return mapStub();
    }

    final lat = position.latitude;
    final lng = position.longitude;

    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(lat, lng),
        initialZoom: _initialZoom,
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds(
            LatLng(lat - _mapOffset, lng - _mapOffset),
            LatLng(lat + _mapOffset, lng + _mapOffset),
          ),
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        )
      ],
    );
  }

  Widget mapStub() => Container(
    alignment: Alignment.center,
    child: const CircularProgressIndicator(),
  );
}
