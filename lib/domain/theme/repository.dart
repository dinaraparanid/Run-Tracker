import 'package:run_tracker/domain/theme/theme.dart';

abstract class ThemeRepository {
  Future<Theme> getCurrentTheme();
  Future<void> updateCurrentTheme(Theme theme);
}
