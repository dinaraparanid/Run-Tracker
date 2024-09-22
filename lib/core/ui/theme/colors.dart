import 'package:flutter/cupertino.dart';
import 'package:run_tracker/domain/theme/theme.dart';

const _Cultured = Color(0xFFF4F4F8);
const _BlackChocolate = Color(0xFF1A1D07);
const _Charcoal = Color(0xFF373F51);
const _Platinum = Color(0xFFD8DBE2);
const _Moonstone = Color(0xFF58A4B0);
const _Melon = Color(0xFFDAA49A);

@immutable
final class AppColors {
  final AppBackgroundColors background;
  final AppTextColors text;
  final AppButtonColors button;
  final AppProgressIndicatorColor indicator;

  const AppColors({
    required this.background,
    required this.text,
    required this.button,
    required this.indicator,
  });

  factory AppColors.fromTheme(Theme theme) => switch (theme) {
    Theme.dark => AppColors._darkTheme(),
    Theme.light => AppColors._lightTheme(),
  };

  factory AppColors._darkTheme() => AppColors(
    background: AppBackgroundColors._darkTheme(),
    text: AppTextColors._darkTheme(),
    button: AppButtonColors._darkTheme(),
    indicator: AppProgressIndicatorColor._darkTheme(),
  );

  factory AppColors._lightTheme() => AppColors(
    background: AppBackgroundColors._lightTheme(),
    text: AppTextColors._lightTheme(),
    button: AppButtonColors._lightTheme(),
    indicator: AppProgressIndicatorColor._lightTheme(),
  );
}

@immutable
final class AppBackgroundColors {
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
final class AppTextColors {
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
final class AppButtonColors {
  final Color topBar;
  final AppFabColors fab;

  const AppButtonColors({
    required this.topBar,
    required this.fab,
  });

  factory AppButtonColors._darkTheme() => AppButtonColors(
    topBar: _Cultured,
    fab: AppFabColors._darkTheme(),
  );

  factory AppButtonColors._lightTheme() => AppButtonColors(
    topBar: _BlackChocolate,
    fab: AppFabColors._lightTheme(),
  );
}

@immutable
final class AppFabColors {
  final Color content;
  final Color background;

  const AppFabColors({
    required this.content,
    required this.background,
  });

  factory AppFabColors._darkTheme() => const AppFabColors(
      content: _Charcoal,
      background: _Melon,
  );

  factory AppFabColors._lightTheme() => const AppFabColors(
    content: _Charcoal,
    background: _Melon,
  );
}

@immutable
final class AppProgressIndicatorColor {
  final Color primary;

  const AppProgressIndicatorColor({
    required this.primary,
  });

  factory AppProgressIndicatorColor._darkTheme() => const AppProgressIndicatorColor(
      primary: _Moonstone,
  );

  factory AppProgressIndicatorColor._lightTheme() => const AppProgressIndicatorColor(
    primary: _Moonstone,
  );
}
