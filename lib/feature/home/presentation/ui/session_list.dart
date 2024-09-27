import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/core/ui/theme/images.dart';
import 'package:run_tracker/feature/analytics/presentation/screen.dart';
import 'package:run_tracker/feature/home/presentation/ui/session_item.dart';
import 'package:run_tracker/feature/home/provider/notifier.dart';

final class SessionList extends ConsumerWidget {
  const SessionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionProvider);
    final theme = ref.watch(appThemeProvider);
    final localizations = AppLocalizations.of(context)!;

    if (sessions.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            fillOverscroll: true,
            child: IntrinsicHeight(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage(AppImages.load('stub.png')),
                      width: theme.dimensions.size.big,
                      height: theme.dimensions.size.big,
                    ),

                    SizedBox(height: theme.dimensions.padding.extraMedium),

                    Text(
                      '${localizations.home_start_first_session}!',
                      style: theme.typography.h.h3.copyWith(
                        color: theme.colors.text.primary,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }

    return ListView.separated(
      itemCount: sessions.length,
      padding: EdgeInsets.symmetric(
        horizontal: theme.dimensions.padding.medium, 
        vertical: theme.dimensions.padding.big,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnalyticsScreen()),
        ),
        child: SessionItem(session: sessions[index]),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: theme.dimensions.padding.medium),
    );
  }
}
