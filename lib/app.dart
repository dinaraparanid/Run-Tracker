import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/screen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final backgroundColor = theme.colors.background.primary;

    // TODO: final home = ...

    return MaterialApp(
      color: backgroundColor,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SprintScreen(), // TODO: HomeScreen()
    );
  }
}