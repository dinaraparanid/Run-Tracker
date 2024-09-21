import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

class SprintTimer extends ConsumerWidget {
  const SprintTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final strings = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '00:00:00',
          style: theme.typography.h.h1.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          strings.sprint_time,
          style: theme.typography.caption.copyWith(
              color: theme.colors.text.primary
          ),
        ),
      ],
    );
  }
}
