import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/ready_steady_go/provider/notifier.dart';

const _readyDuration = 2;
const _steadyDuration = 1;
const _goDuration = 0;

final class ReadySteadyGoCountdown extends ConsumerWidget {
  const ReadySteadyGoCountdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(readySteadyGoProvider);
    final notifier = ref.read(readySteadyGoProvider.notifier);
    final strings = AppLocalizations.of(context)!;

    return CircularCountDownTimer(
      width: theme.dimensions.size.large,
      height: theme.dimensions.size.large,
      duration: state.countdown,
      fillColor: theme.colors.indicator.primary,
      ringColor: theme.colors.indicator.background,
      isReverse: true,
      strokeWidth: theme.dimensions.size.line.extraBig,
      textStyle: theme.typography.h.h1.copyWith(
        color: theme.colors.indicator.background,
        fontWeight: FontWeight.w600,
      ),
      timeFormatterFunction: (_, duration) => switch (duration.inSeconds) {
        _readyDuration => strings.rsg_ready,
        _steadyDuration => strings.rsg_steady,
        _goDuration => '${strings.rsg_go}!',
        _ => '',
      },
      onComplete: () => notifier.onCountdownFinished(context),
    );
  }
}
