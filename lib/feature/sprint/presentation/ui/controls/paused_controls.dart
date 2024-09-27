import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/controls/resume.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/controls/stop.dart';

final class PausedControls extends ConsumerWidget {
  const PausedControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ResumeButton(),
        SizedBox(width: theme.dimensions.padding.small),
        const StopButton(),
      ],
    );
  }
}
