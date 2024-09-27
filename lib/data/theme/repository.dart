import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/domain/theme/mod.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

const _themeKey = 'theme';

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => _ThemeRepositoryImpl()
);

final class _ThemeRepositoryImpl extends ThemeRepository {
  @override
  Future<Stream<Theme>> currentThemeStream() async {
    final prefs = await StreamingSharedPreferences.instance;
    final stream = prefs.getInt(_themeKey, defaultValue: 0);
    return stream.map((ord) => Theme.values[ord]);
  }

  @override
  Future<void> updateCurrentTheme(Theme theme) async {
    final prefs = await StreamingSharedPreferences.instance;
    await prefs.setInt(_themeKey, theme.index);
  }
}
