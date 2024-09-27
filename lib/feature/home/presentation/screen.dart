import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/home/presentation/ui/session_list.dart';
import 'package:run_tracker/feature/home/provider/notifier.dart';
import 'package:run_tracker/feature/sprint/presentation/screen.dart';
import 'package:run_tracker/feature/home/presentation/ui/start_button.dart';

const _pullRefreshAnimDuration = Duration(seconds: 1);

final class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(sessionProvider.notifier);
    final backgroundColor = theme.colors.background.primary;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          localizations.app_name,
          style: theme.typography.h.h2.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: theme.colors.indicator.primary,
        onRefresh: () async {
          await notifier.loadSessions();
          await Future.delayed(_pullRefreshAnimDuration);
        },
        child: Column(
          children: [
            const Expanded(child: SessionList()),

            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: theme.dimensions.padding.enormous),
                child: StartButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SprintScreen()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
