import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/core/ui/theme/images.dart';
import 'package:universal_platform/universal_platform.dart';

class SprintScreen extends ConsumerWidget {
  const SprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    if (UniversalPlatform.isAndroid) return materialWidget(theme);
    if (UniversalPlatform.isIOS) return cupertinoWidget(theme);
    return Container();
  }

  Widget materialWidget(AppTheme theme) {
    final backgroundColor = theme.colors.background.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: cancelIcon(theme),
      ),
      body: Container(),
    );
  }

  Widget cupertinoWidget(AppTheme theme) {
    final backgroundColor = theme.colors.background.primary;

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: backgroundColor,
        leading: cancelIcon(theme),
      ),
      child: Container(),
    );
  }

  Widget cancelIcon(AppTheme theme) => Image(
    image: AssetImage(AppImages.load('ic_cross.png')),
    color: theme.colors.button.topBar,
  );
}
