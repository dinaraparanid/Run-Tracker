import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/core/ui/theme/images.dart';

class SprintCancelButton extends ConsumerWidget {
  const SprintCancelButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: Ink(
        child: content(theme),
      ),
    );
  }

  Widget content(AppTheme theme) => Container(
    padding: EdgeInsets.all(theme.dimensions.padding.small),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.dimensions.radius.small)
    ),
    child: Image(
      image: AssetImage(AppImages.load('ic_cross.png')),
      color: theme.colors.button.topBar,
    ),
  );
}
