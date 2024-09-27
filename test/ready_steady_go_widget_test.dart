import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/ui/countdown.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/screen.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/ui/road.dart';
import 'package:run_tracker/feature/ready_steady_go/provider/notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets('ReadySteadyGoScreen initial state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ReadySteadyGoScreen(),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Stack), findsAny);
    expect(find.byType(Align), findsAny);
    expect(find.byType(Padding), findsAny);
    expect(find.byType(ReadySteadyGoRoadBackground), findsOneWidget);
    expect(find.byType(ReadySteadyGoCountdown), findsOneWidget);
  });

/*
  testWidgets('ReadySteadyGoScreen padding values',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ReadySteadyGoScreen(),
        ),
      ),
    );

    final container = ProviderContainer();
    final theme = container.read(appThemeProvider);

    final roadPadding = tester.widget<Padding>(find.byType(Padding).first);
    final countdownPadding = tester.widget<Padding>(find.byType(Padding).last);

    expect(roadPadding.padding,
        EdgeInsets.only(bottom: theme.dimensions.padding.large));
    expect(countdownPadding.padding,
        EdgeInsets.only(top: theme.dimensions.padding.extraEnormous));
  });
*/
  testWidgets('ReadySteadyGoScreen disposes timer properly',
      (WidgetTester tester) async {
    final notifier = ReadySteadyGoNotifier();

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ReadySteadyGoScreen(),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    expect(notifier.state.countdown, equals(2));

    await tester.pumpWidget(Container());
    expect(() => notifier.dispose(), returnsNormally);
  });
}
