import 'package:flutter/cupertino.dart';
import 'package:run_tracker/domain/theme/theme.dart';

const _Cultured = Color(0xFFF4F4F8);
const _BlackChocolate = Color(0xFF1A1D07);
const _Charcoal = Color(0xFF373F51);
const _Platinum = Color(0xFFD8DBE2);

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
  final Color primary;

  const AppBackgroundColors({required this.primary});

  factory AppBackgroundColors._darkTheme() => const AppBackgroundColors(
    primary: _Charcoal,
  );

  factory AppBackgroundColors._lightTheme() => const AppBackgroundColors(
    primary: _Platinum,
  );
}

@immutable
class AppTextColors {
  final Color primary;

  const AppTextColors({required this.primary});

  factory AppTextColors._darkTheme() => const AppTextColors(
    primary: _Cultured,
  );

  factory AppTextColors._lightTheme() => const AppTextColors(
    primary: _BlackChocolate,
  );
}

@immutable
class AppButtonColors {
  final Color topBar;

  const AppButtonColors({required this.topBar});

  factory AppButtonColors._darkTheme() => const AppButtonColors(
    topBar: _Cultured,
  );

  factory AppButtonColors._lightTheme() => const AppButtonColors(
    topBar: _BlackChocolate,
  );
}
