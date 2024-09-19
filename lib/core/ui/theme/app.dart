import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/colors.dart';
import 'package:run_tracker/core/ui/theme/dimensions.dart';
import 'package:run_tracker/core/ui/theme/typography.dart';
import 'package:run_tracker/data/theme/repository.dart';
import 'package:run_tracker/domain/theme/theme.dart';

final appThemeProvider = Provider((ref) async {
  final repo = ref.watch(themeRepositoryProvider);
  final theme = await repo.getCurrentTheme();
  return AppTheme.fromTheme(theme);
});

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
