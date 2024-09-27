import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/analytics/provider/notifier.dart';
import 'package:run_tracker/feature/analytics/presentation/ui/heart_health.dart';
import 'package:run_tracker/feature/analytics/presentation/ui/progress_box.dart';
import 'package:run_tracker/feature/analytics/records/records_box.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(sessionAnalyticsProvider);
    final strings = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.colors.background.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: theme.dimensions.padding.large),
            ProgressBox(
              progressValue: '${state.formattedTotalDistance} ${strings.unit_km}',
              totalHours: '${state.formattedTotalDuration} ${strings.unit_hours}',
              averagePace: '${state.formattedAvgPace} ${strings.unit_kmh}',
            ),
            SizedBox(height: theme.dimensions.padding.big),
            const HeartHealth(),
            SizedBox(height: theme.dimensions.padding.big),
            const RecordsBox(),
            SizedBox(height: theme.dimensions.padding.enormous),
          ],
        ),
      ),
    );
  }
}