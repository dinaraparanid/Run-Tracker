import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/colors.dart';
import 'package:run_tracker/core/ui/theme/dimensions.dart';
import 'package:run_tracker/core/ui/theme/notifier.dart';
import 'package:run_tracker/core/ui/theme/typography.dart';
import 'package:run_tracker/data/theme/repository.dart';
import 'package:run_tracker/domain/theme/theme.dart';

final _appThemeNotifierProvider = StateNotifierProvider<AppThemeNotifier, AppTheme>((ref) {
  final repo = ref.watch(themeRepositoryProvider);
  return AppThemeNotifier(repo);
});

final appThemeProvider = Provider((ref) => ref.watch(_appThemeNotifierProvider));

@immutable
class AppTheme {
  final AppColors colors;
  final AppDimensions dimensions;
  final AppTypography typography;

  const AppTheme({
    required this.colors,
    this.dimensions = const AppDimensions(),
    this.typography = const AppTypography(),
  });

  factory AppTheme.fromTheme(Theme theme) =>
      AppTheme(colors: AppColors.fromTheme(theme));
}
