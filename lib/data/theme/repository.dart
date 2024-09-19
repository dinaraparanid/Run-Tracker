import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/domain/theme/mod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeKey = "theme";

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => _ThemeRepositoryImpl()
);

class _ThemeRepositoryImpl extends ThemeRepository {
  @override
  Future<Theme> getCurrentTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final ord = prefs.getInt(_themeKey);
    return ord == null ? Theme.light : Theme.values[ord];
  }

  @override
  Future<void> updateCurrentTheme(Theme theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, theme.index);
  }
}
