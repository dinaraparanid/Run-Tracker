import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/cancel_button.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/map/map.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/properties/properties.dart';

class SprintScreen extends ConsumerWidget {
  const SprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final backgroundColor = theme.colors.background.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: const SprintCancelButton(),
      ),
      body: const Stack(
        alignment: Alignment.topCenter,
        children: [
          Flex(
            direction: Axis.vertical,
            children: [Expanded(child: SprintMap())]
          ),
          Wrap(children: [SprintProperties()],),
        ],
      ),
    );
  }
}
