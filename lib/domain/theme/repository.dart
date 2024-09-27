import 'package:run_tracker/domain/theme/theme.dart';

abstract class ThemeRepository {
  Future<Stream<Theme>> currentThemeStream();
  Future<void> updateCurrentTheme(Theme theme);
}
