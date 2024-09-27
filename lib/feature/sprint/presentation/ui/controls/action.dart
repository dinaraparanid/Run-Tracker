import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

class SprintAction extends ConsumerWidget {
  final String tag;
  final String text;
  final void Function() onClick;

  const SprintAction({
    super.key,
    required this.tag,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return FloatingActionButton.large(
      heroTag: tag,
      onPressed: () => onClick(),
      backgroundColor: theme.colors.button.fab.background,
      child: Padding(
        padding: EdgeInsets.all(theme.dimensions.padding.small),
        child: Text(
          text,
          style: theme.typography.h.h3.copyWith(
            color: theme.colors.button.fab.content,
          ),
        ),
      ),
    );
  }
}
