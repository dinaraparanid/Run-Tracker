import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/root/presentation/screen.dart';
import 'package:run_tracker/domain/theme/theme.dart';
import 'package:run_tracker/app.dart';
import 'package:run_tracker/core/ui/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final mockThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme(
    colors: AppColors.fromTheme(Theme.light),
  );
});

void main() {
  group('App widget test', () {
    testWidgets('renders App with light theme colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appThemeProvider.overrideWithValue(
              AppTheme(
                colors: AppColors.fromTheme(Theme.light),
              ),
            ),
          ],
          child: const App(),
        ),
      );

      final materialAppFinder = find.byType(MaterialApp);
      expect(materialAppFinder, findsOneWidget);

      final MaterialApp materialApp = tester.widget(materialAppFinder);

      final lightThemeColors = AppColors.fromTheme(Theme.light);
      expect(materialApp.color, lightThemeColors.background.primary);


      expect(find.byType(RootScreen), findsOneWidget);

      expect(materialApp.localizationsDelegates, AppLocalizations.localizationsDelegates);
      expect(materialApp.supportedLocales, AppLocalizations.supportedLocales);
    });

    testWidgets('renders App with dark theme colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appThemeProvider.overrideWithValue(
              AppTheme(
                colors: AppColors.fromTheme(Theme.dark),
              ),
            ),
          ],
          child: const App(),
        ),
      );

      final materialAppFinder = find.byType(MaterialApp);
      expect(materialAppFinder, findsOneWidget);

      final MaterialApp materialApp = tester.widget(materialAppFinder);

      final darkThemeColors = AppColors.fromTheme(Theme.dark);
      expect(materialApp.color, darkThemeColors.background.primary);

      expect(find.byType(RootScreen), findsOneWidget);

      expect(materialApp.localizationsDelegates, AppLocalizations.localizationsDelegates);
      expect(materialApp.supportedLocales, AppLocalizations.supportedLocales);
    });
  });
}
