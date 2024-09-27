import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

const _shadowSpreadRadius = 2.0;
const _shadowBlurRadius = 8.0;

final class ProgressBox extends ConsumerWidget {
  final String progressValue;
  final String totalHours;
  final String averagePace;

  const ProgressBox({
    super.key,
    required this.progressValue,
    required this.totalHours,
    required this.averagePace,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final strings = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.all(theme.dimensions.padding.extraMedium),
      padding: EdgeInsets.all(theme.dimensions.padding.big),
      decoration: BoxDecoration(
        color: theme.colors.background.primary,
        borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
        boxShadow: const [
          BoxShadow(
            spreadRadius: _shadowSpreadRadius,
            blurRadius: _shadowBlurRadius,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${strings.analytics_my_progress}:',
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: theme.dimensions.padding.medium),

          Text(
            progressValue,
            style: theme.typography.h.h1.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            strings.analytics_total_distance,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text.primary,
            ),
          ),

          SizedBox(height: theme.dimensions.padding.big),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn(
                value: totalHours,
                label: strings.analytics_total_time,
                valueStyle: theme.typography.h.h2.copyWith(
                  color: theme.colors.text.primary,
                ),
                labelStyle: theme.typography.regular.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),
              _buildStatColumn(
                value: averagePace,
                label: strings.analytics_avg_pace,
                valueStyle: theme.typography.h.h2.copyWith(
                  color: theme.colors.text.primary,
                ),
                labelStyle: theme.typography.regular.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn({
    required String value,
    required String label,
    required TextStyle valueStyle,
    required TextStyle labelStyle,
  }) => Column(
    children: [
      Text(value, style: valueStyle),
      Text(label, style: labelStyle),
    ],
  );
}