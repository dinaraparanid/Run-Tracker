import 'package:flutter/cupertino.dart';
import 'package:run_tracker/domain/theme/theme.dart';

// TODO: colors

@immutable
class AppColors {
  final AppBackgroundColors background;
  final AppTextColors text;
  final AppButtonColors button;

  const AppColors({
    required this.background,
    required this.text,
    required this.button,
  });

  factory AppColors.fromTheme(Theme theme) => switch (theme) {
    Theme.dark => AppColors._darkTheme(),
    Theme.light => AppColors._lightTheme(),
  };

  factory AppColors._darkTheme() => AppColors(
      background: AppBackgroundColors._darkTheme(),
      text: AppTextColors._darkTheme(),
      button: AppButtonColors._darkTheme(),
  );

  factory AppColors._lightTheme() => AppColors(
    background: AppBackgroundColors._lightTheme(),
    text: AppTextColors._lightTheme(),
    button: AppButtonColors._lightTheme(),
  );
}

@immutable
class AppBackgroundColors {
  // TODO: colors

  const AppBackgroundColors();

  // TODO: dark theme
  factory AppBackgroundColors._darkTheme() => const AppBackgroundColors();

  // TODO: light theme
  factory AppBackgroundColors._lightTheme() => const AppBackgroundColors();
}

@immutable
class AppTextColors {
  // TODO: colors

  const AppTextColors();

  // TODO: dark theme
  factory AppTextColors._darkTheme() => const AppTextColors();

  // TODO: light theme
  factory AppTextColors._lightTheme() => const AppTextColors();
}

@immutable
class AppButtonColors {
  // TODO: colors

  const AppButtonColors();

  // TODO: dark theme
  factory AppButtonColors._darkTheme() => const AppButtonColors();

  // TODO: light theme
  factory AppButtonColors._lightTheme() => const AppButtonColors();
}
