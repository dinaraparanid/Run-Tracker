import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/screen.dart';
import 'package:run_tracker/feature/ready_steady_go/provider/back_result.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/controls/action.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/foreground_task_permission_dialog.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';
import 'package:run_tracker/feature/sprint/provider/properties.dart';
import 'package:run_tracker/feature/sprint/provider/state.dart';
import 'package:run_tracker/utils/extensions/string.dart';

const _distanceFormat = 4;

final class StartButton extends ConsumerWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(sprintNotifierProvider);
    final notifier = ref.read(sprintNotifierProvider.notifier);
    final strings = AppLocalizations.of(context)!;

    return SprintAction(
      tag: 'start',
      text: strings.sprint_start,
      onClick: () async {
        final permissionResult = await notifier.tryRequestPermissions();

        if (context.mounted) {
          switch (permissionResult) {
            case true:
              _navigateToRSG(context: context, state: state, notifier: notifier);

            case false:
              ForegroundTaskPermissionDialog.show(
                context: context,
                theme: theme,
                strings: strings,
                onConfirm: notifier.openAppSettings,
              );
          }
        }
      },
    );
  }

  void _navigateToRSG({
    required BuildContext context,
    required SprintState state,
    required SprintNotifier notifier,
  }) async {
    final strings = AppLocalizations.of(context)!;

    final res = await Navigator.push<ReadySteadyGoBackResult>(
      context,
      MaterialPageRoute(builder: (context) => const ReadySteadyGoScreen()),
    ) ?? Dismiss();

    switch (res) {
      case Dismiss():
        // do nothing

      case LaunchSprint():
        notifier.onSprintStart(
          notificationTitle: strings.sprint_notification_title,
          notificationText: '',
          pauseButtonTitle: strings.pause,
          resumeButtonTitle: strings.resume,
          stopButtonTitle: strings.stop,
          distanceFormatter: (double meters) =>
            _kmDistanceFormatter(meters: meters),
        );
    }
  }

  String _notificationText(SprintState state, AppLocalizations strings) =>
      '''
      ${strings.sprint_notification_distance}: ${state.distanceFormatted} ${strings.sprint_distance_km}
      ${strings.sprint_notification_time}: ${state.sprintTimeFormatted}
      ''';
}

String _kmDistanceFormatter({required double meters}) =>
  '${meters / 1000}'.take(_distanceFormat);
