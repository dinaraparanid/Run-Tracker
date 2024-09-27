import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/domain/session/session.dart';
import 'package:run_tracker/feature/analytics/provider/notifier.dart';
import 'package:run_tracker/feature/analytics/provider/state.dart';

const _shadowSpreadRadius = 2.0;
const _shadowBlurRadius = 8.0;
const _daysInWeek = 7;
const _valueMaxFraction = 2;

final class HeartHealth extends ConsumerStatefulWidget {
  const HeartHealth({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeartHealthState();
}

class _HeartHealthState extends ConsumerState<HeartHealth> {
  DateTime _currentDate = DateTime.now();

  DateTime get _startOfWeek => _currentDate.subtract(Duration(days: _currentDate.weekday - 1));

  void _previousWeek() => setState(() {
    _currentDate = _currentDate.subtract(const Duration(days: _daysInWeek));
  });

  void _nextWeek() => setState(() {
    _currentDate = _currentDate.add(const Duration(days: _daysInWeek));
  });

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(sessionAnalyticsProvider);
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
            '${strings.analytics_heart_health}:',
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: theme.dimensions.padding.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.arrow_left),
                onPressed: _previousWeek,
              ),
              Text(
                '${_startOfWeek.day}/${_startOfWeek.month}/${_startOfWeek.year}',
                style: theme.typography.h.h4.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.arrow_right),
                onPressed: _nextWeek,
              ),
            ],
          ),
          SizedBox(height: theme.dimensions.padding.big),
          _buildWeeklyProgress(state: state, strings: strings, theme: theme),
        ],
      ),
    );
  }

  Widget _buildWeeklyProgress({
    required SessionAnalyticsState state,
    required AppLocalizations strings,
    required AppTheme theme,
  }) {
    final headerTextStyle = theme.typography.body.copyWith(
      color: theme.colors.text.primary,
    );

    final dataTextStyle = theme.typography.regular.copyWith(
      color: theme.colors.text.primary,
    );

    final firstDayOfWeek = _startOfWeek;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaderText(strings.analytics_day_of_week, 3, headerTextStyle),
            _buildHeaderText(strings.analytics_date, 3, headerTextStyle),
            _buildHeaderText(strings.analytics_distance, 3, headerTextStyle),
            _buildHeaderText(strings.analytics_time, 3, headerTextStyle),
          ],
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        ...List.generate(_daysInWeek, (index) {
          // TODO: убрать логику с ui, вынести в стейт

          final date = firstDayOfWeek.add(Duration(days: index));
          final dayOfWeek = DateFormat.E().format(date);

          final session = state.sessions.firstWhere(
            (session) => session.date.isSameDay(date),
            orElse: () => Session.create(date: date),
          );

          final progress = session.distance;
          final time = session.duration.inHours + session.duration.inMinutes % 60 / 60;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDataText(dayOfWeek, 2, dataTextStyle),
              _buildDataText('${date.day}/${date.month}/${date.year}', 2, dataTextStyle),
              _buildDataText(progress.toStringAsFixed(_valueMaxFraction), 2, dataTextStyle),
              _buildDataText(time.toStringAsFixed(_valueMaxFraction), 2, dataTextStyle),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildHeaderText(String text, int flex, TextStyle style) => Expanded(
    flex: flex,
    child: Center(child: Text(text, style: style)),
  );

  Widget _buildDataText(String text, int flex, TextStyle style) => Expanded(
    flex: flex,
    child: Center(child: Text(text, style: style)),
  );
}

extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
}
