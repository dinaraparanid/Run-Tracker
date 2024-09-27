import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/domain/session/session.dart';

final class SessionItem extends ConsumerWidget {
  final Session session;

  const SessionItem({super.key, required this.session});

  String formatDuration(Duration duration, AppLocalizations strings) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$minutes ${strings.home_time_minutes}, $seconds ${strings.home_time_seconds}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;
    final theme = ref.watch(appThemeProvider);
    final textTheme = theme.typography;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.small)
        )
      ),
      tileColor: theme.colors.background.item,
      title: Text(
        '${session.date.year}-${session.date.month}-${session.date.day}',
        style: textTheme.h.h4.copyWith(
          color: theme.colors.text.primary,
          fontWeight: FontWeight.w500,
        ),

      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${(session.distance / 1000).toStringAsFixed(1)} ${strings.home_distance_km}',
            style: textTheme.regular.copyWith(color: theme.colors.text.primary),
          ),
          Text(
            formatDuration(session.duration, strings),
            style: textTheme.regular.copyWith(color: theme.colors.text.primary),
          ),
        ],
      ),
    );
  }
}
