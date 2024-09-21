import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

class SprintDistance extends ConsumerWidget {
  const SprintDistance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final strings = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '0.00',
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          strings.sprint_distance_km,
          style: theme.typography.caption.copyWith(
              color: theme.colors.text.primary
          ),
        ),
      ],
    );
  }
}
