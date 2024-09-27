import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/data/theme/repository.dart';
import 'package:run_tracker/domain/theme/mod.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, Theme>(
  (ref) => ThemeNotifier(ref.watch(themeRepositoryProvider))
);

class ThemeNotifier extends StateNotifier<Theme> {
  final ThemeRepository _themeRepository;

  ThemeNotifier(this._themeRepository) : super(Theme.system()) {
    _subscribeOnThemeUpdates();
  }

  Future<void> _subscribeOnThemeUpdates() async {
    final stream = await _themeRepository.currentThemeStream();
    stream.listen((theme) => state = theme);
  }

  Future<void> toggleTheme() async {
    final newTheme = state == Theme.light ? Theme.dark : Theme.light;
    state = newTheme;
    await _themeRepository.updateCurrentTheme(newTheme);
  }
}