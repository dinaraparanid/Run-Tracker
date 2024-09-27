import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:run_tracker/feature/analytics/presentation/screen.dart';
import 'package:run_tracker/feature/home/presentation/screen.dart';
import 'package:run_tracker/feature/root/presentation/screen.dart';
import 'package:run_tracker/feature/settings/presentation/screen.dart';


void main() {
  testWidgets('Root Screen init', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: RootScreen(),
        ),
      ),
    );
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(AnalyticsScreen), findsNothing);
    expect(find.byType(SettingsScreen), findsNothing);
  });

  testWidgets('displays CupertinoBottomNavigationBar on iOS', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: RootScreen(),
        ),
      ),
    );

    expect(find.byType(CupertinoTabBar), findsNothing); // :) debugDefaultTargetPlatform does not work
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('displays MaterialBottomNavigationBar on android', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: RootScreen(),
        ),
      ),
    );

    expect(find.byType(CupertinoTabBar), findsNothing);
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });
}
