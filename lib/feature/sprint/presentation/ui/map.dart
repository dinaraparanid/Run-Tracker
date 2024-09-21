import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class SprintMap extends ConsumerWidget {
  const SprintMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: real coordinates
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(55.796391, 49.108891),
        initialZoom: 18,
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds(
            const LatLng(55.796391 - 5, 49.108891 - 5),
            const LatLng(55.796391 + 5, 49.108891 + 5),
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
}
