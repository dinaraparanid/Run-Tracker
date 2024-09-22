import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';

final class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(sprintNotifierProvider.notifier);
    final strings = AppLocalizations.of(context)!;

    return FloatingActionButton.large(
      onPressed: notifier.onStart,
      backgroundColor: theme.colors.button.fab.background,
      child: Padding(
        padding: EdgeInsets.all(theme.dimensions.padding.small),
        child: Text(
          strings.sprint_start,
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.button.fab.content,
          ),
        ),
      ),
    );
  }
}
