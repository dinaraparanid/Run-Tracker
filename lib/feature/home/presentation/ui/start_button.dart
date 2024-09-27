import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

final class StartButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const StartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final strings = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: theme.dimensions.padding.medium,
          vertical: theme.dimensions.padding.small,
        ),
        backgroundColor: theme.colors.button.fab.background,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            strings.home_start_session,
            textAlign: TextAlign.center,
            style: theme.typography.h.h3.copyWith(
                color: theme.colors.button.fab.content
            ),
          ),
        ],
      ),
    );
  }
}
