import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/provider/notifier.dart';

final class SprintMapZoomButtons extends ConsumerWidget {
  final EdgeInsets? padding;
  final Alignment alignment;
  final Color? backgroundColor;
  final Color? iconColor;

  const SprintMapZoomButtons({
    super.key,
    this.padding,
    this.alignment = Alignment.bottomRight,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(sprintNotifierProvider.notifier);

    final background = backgroundColor ?? theme.colors.button.fab.background;
    final icon = iconColor ?? theme.colors.button.fab.icon;

    final buttonsPadding = padding ?? EdgeInsets.only(
      right: theme.dimensions.padding.small,
      bottom: theme.dimensions.padding.small,
    );

    return Align(
      alignment: alignment,
      child: Padding(
        padding: buttonsPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              backgroundColor: background,
              onPressed: notifier.zoomIn,
              child: Icon(CupertinoIcons.zoom_in, color: icon),
            ),
            SizedBox(height: theme.dimensions.padding.small),
            FloatingActionButton(
              backgroundColor: background,
              onPressed: notifier.zoomOut,
              child: Icon(CupertinoIcons.zoom_out, color: icon),
            ),
          ],
        ),
      ),
    );
  }
}
