import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:universal_platform/universal_platform.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final backgroundColor = theme.colors.background.primary;

    // TODO: final home = ...

    if (UniversalPlatform.isAndroid) {
      return materialWidget(
          theme: theme,
          // TODO: home screen
          home: Scaffold(
            backgroundColor: backgroundColor,
            body: const Text("TODO: Home Screen"),
          )
      );
    }

    if (UniversalPlatform.isIOS) {
      return cupertinoWidget(
          theme: theme,
        // TODO: home screen
          home: CupertinoPageScaffold(
            backgroundColor: backgroundColor,
            child: const Text("TODO: Home Screen"),
          ),
      );
    }

    return Container();
  }

  Widget materialWidget({required AppTheme theme, required Widget home}) {
    final backgroundColor = theme.colors.background.primary;

    return MaterialApp(
      color: backgroundColor,
      home: home,
    );
  }

  Widget cupertinoWidget({required AppTheme theme, required Widget home}) {
    final backgroundColor = theme.colors.background.primary;

    return CupertinoApp(
      color: backgroundColor,
      home: home,
    );
  }
}