import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/map/marker_painter.dart';

const _markerSize = 18.0;

final class SprintMarker extends ConsumerWidget {
  const SprintMarker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return CustomPaint(
      size: const Size(_markerSize, _markerSize),
      painter: SprintMarkerPainter(
          color: theme.colors.indicator.primary,
          top: _markerSize / 2,
          left: _markerSize / 2,
      ),
    );
  }
}