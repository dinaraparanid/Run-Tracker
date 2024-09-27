import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/controls/action.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';

final class PauseButton extends ConsumerWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;
    final notifier = ref.read(sprintNotifierProvider.notifier);

    return SprintAction(
      tag: 'pause',
      text: strings.pause,
      onClick: notifier.onSprintPaused,
    );
  }
}
