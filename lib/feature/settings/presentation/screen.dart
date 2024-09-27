import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/domain/theme/theme.dart';
import 'package:run_tracker/feature/settings/provider/notifier.dart';

final class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeNotifier = ref.watch(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider);
    final localizations = AppLocalizations.of(context);
    final backgroundColor = theme.colors.background.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          localizations!.settings_title,
          style: theme.typography.h.h2.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(theme.dimensions.padding.extraMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.settings_theme_switch,
                  style: theme.typography.regular.copyWith(
                    color: theme.colors.text.primary,
                  ),
                ),
                Switch(
                  value: themeMode == Theme.dark,
                  activeTrackColor: theme.colors.indicator.primary,
                  onChanged: (value) async => await themeNotifier.toggleTheme(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}