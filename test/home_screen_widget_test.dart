import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:run_tracker/feature/home/presentation/screen.dart';
import 'package:run_tracker/feature/home/presentation/ui/session_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/feature/home/presentation/ui/start_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets('renders HomeScreen with AppBar, SessionList, StartButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomeScreen(),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
    expect(find.byType(SessionList), findsOneWidget);
    expect(find.byType(StartButton), findsOneWidget);
  });

  testWidgets('StartButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: HomeScreen(),
        ),
      ),
    );
    expect(find.byType(StartButton), findsOneWidget);
    await tester.tap(find.byType(StartButton));
  });
}
