import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/core/ui/theme/images.dart';

final class ReadySteadyGoRoadBackground extends ConsumerWidget {
  const ReadySteadyGoRoadBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return SizedBox(
      width: theme.dimensions.size.large,
      child: Image(
        image: AssetImage(AppImages.load('road_background.png')),
        opacity: const AlwaysStoppedAnimation(.3),
      ),
    );
  }
}
