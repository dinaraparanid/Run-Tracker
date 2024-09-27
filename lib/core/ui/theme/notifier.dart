import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/domain/mod.dart';

final class AppThemeNotifier extends StateNotifier<AppTheme> {
  final ThemeRepository _repository;

  AppThemeNotifier(this._repository) : super(AppTheme.fromTheme(Theme.system())) {
    _repository
      .currentThemeStream()
      .then(
        (stream) => stream
          .map(AppTheme.fromTheme)
          .listen((theme) => state = theme),
      );
  }
}
