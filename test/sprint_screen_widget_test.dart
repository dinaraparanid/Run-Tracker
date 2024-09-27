import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:run_tracker/feature/home/presentation/ui/start_button.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/cancel_button.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/map/map.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/properties/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:run_tracker/feature/root/presentation/screen.dart';

void main() {
  testWidgets('SprintScreen initial state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: RootScreen(),
        ),
      ),
    );

    final startButton = find.byType(StartButton);
    expect(startButton, findsOneWidget);
    await tester.tap(startButton);
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(seconds: 1));
    }

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(SprintCancelButton), findsOneWidget);
    expect(find.byType(Flex), findsOneWidget);
    expect(find.byType(SprintMap), findsOneWidget);
    expect(find.byType(Wrap), findsOneWidget);
    expect(find.byType(SprintProperties), findsOneWidget);
  });
}
