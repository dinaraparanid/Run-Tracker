import 'package:flutter/cupertino.dart';
import 'package:run_tracker/domain/theme/theme.dart';

const _Cultured = Color(0xFFF4F4F8);
const _BlackChocolate = Color(0xFF1A1D07);
const _Charcoal = Color(0xFF373F51);
const _Platinum = Color(0xFFD8DBE2);
const _Moonstone = Color(0xFF58A4B0);
const _Melon = Color(0xFFDAA49A);
const _CarolinaBlue = Color(0xFF81B0C0);
const _PowderBlue = Color(0xFFA9BCD0);

@immutable
final class AppColors {
  final AppBackgroundColors background;
  final AppTextColors text;
  final AppButtonColors button;
  final AppProgressIndicatorColor indicator;
  final AppBottomBarColors bottomBar;
  final AppGradient gradient;

  const AppColors({
    required this.background,
    required this.text,
    required this.button,
    required this.indicator,
    required this.bottomBar,
    required this.gradient,
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
    bottomBar: AppBottomBarColors._default(),
    gradient: AppGradient._default(),
  );

  factory AppColors._lightTheme() => AppColors(
    background: AppBackgroundColors._lightTheme(),
    text: AppTextColors._lightTheme(),
    button: AppButtonColors._lightTheme(),
    indicator: AppProgressIndicatorColor._lightTheme(),
    bottomBar: AppBottomBarColors._default(),
    gradient: AppGradient._default(),
  );
}

@immutable
final class AppBackgroundColors {
  final Color primary;
  final Color item;

  const AppBackgroundColors({
    required this.primary,
    required this.item,
  });

  factory AppBackgroundColors._darkTheme() => const AppBackgroundColors(
    primary: _Charcoal,
    item: _CarolinaBlue,
  );

  factory AppBackgroundColors._lightTheme() => const AppBackgroundColors(
    primary: _Platinum,
    item: _CarolinaBlue,
  );
}

@immutable
final class AppBottomBarColors {
  final Color background;
  final Color selected;
  final Color unselected;

  const AppBottomBarColors({
    required this.background,
    required this.selected,
    required this.unselected,
  });

  factory AppBottomBarColors._default() => const AppBottomBarColors(
    background: _PowderBlue,
    selected: _Moonstone,
    unselected: _Charcoal,
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
  final Color background;

  const AppProgressIndicatorColor({
    required this.primary,
    required this.background,
  });

  factory AppProgressIndicatorColor._darkTheme() => const AppProgressIndicatorColor(
    primary: _Moonstone,
    background: _Platinum,
  );

  factory AppProgressIndicatorColor._lightTheme() => const AppProgressIndicatorColor(
    primary: _Moonstone,
    background: _Platinum,
  );
}

@immutable
final class AppGradient {
  final LinearGradient readySteadyGoBackground;

  const AppGradient({
    required this.readySteadyGoBackground
  });

  factory AppGradient._default() => const AppGradient(
      readySteadyGoBackground: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [_Charcoal, _Moonstone],
      ),
  );
}
