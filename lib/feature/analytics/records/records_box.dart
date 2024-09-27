import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/analytics/records/notifier.dart';

const _shadowSpreadRadius = 1.0;
const _shadowBlurRadius = 4.0;

class RecordsBox extends ConsumerWidget {
  const RecordsBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final records = ref.watch(recordsProvider);

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
          // TODO: в ресурсы
          Text(
            'Records:',
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: theme.dimensions.padding.medium),
          _buildRecordBox(
            context: context,
            title: 'Max Distance',
            value: records.maxDistance.toString(),
            unit: 'km',
            date: records.maxDistanceDate,
            theme: theme,
          ),
          SizedBox(height: theme.dimensions.padding.medium),
          _buildRecordBox(
            context: context,
            title: 'Best Pace',
            value: records.bestPace.isFinite ? records.bestPace.toString() : 'N/A',
            unit: 'min/km',
            date: records.bestPaceDate,
            theme: theme,
          ),
          SizedBox(height: theme.dimensions.padding.medium),
          _buildRecordBox(
            context: context,
            title: 'Max Duration',
            value: records.maxDuration.toString(),
            unit: 'hours',
            date: records.maxDurationDate,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildRecordBox({
    required BuildContext context,
    required String title,
    required String value,
    required String unit,
    required String date,
    required AppTheme theme,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: theme.dimensions.padding.small),
      padding: EdgeInsets.all(theme.dimensions.padding.small),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.typography.h.h4.copyWith(
                  color: theme.colors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$value $unit',
                style: theme.typography.h.h4.copyWith(
                  color: theme.colors.text.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            date,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text.primary,
            ),
          ),
        ],
      ),
    );
  }
}
