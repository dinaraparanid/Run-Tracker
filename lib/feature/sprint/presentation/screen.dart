import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/core/ui/theme/images.dart';

const _cancelIconSize = 48.0;

class SprintScreen extends ConsumerWidget {
  const SprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final backgroundColor = theme.colors.background.primary;

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: backgroundColor,
        leading: Image(
          image: AssetImage(AppImages.load('ic_cross.png')),
          width: _cancelIconSize,
          height: _cancelIconSize,
          color: theme.colors.button.topBar,
        ),
      ),
      child: Container(),
    );
  }
}
