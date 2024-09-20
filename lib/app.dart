import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final backgroundColor = theme.colors.background.primary;

    return CupertinoApp(
      color: backgroundColor,
      home: CupertinoPageScaffold(
          backgroundColor: backgroundColor,
          child: Text("TODO: Home Screen")
      ),
    );
  }
}