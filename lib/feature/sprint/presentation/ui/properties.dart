import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/distance.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/tempo.dart';
import 'package:run_tracker/feature/sprint/presentation/ui/timer.dart';

const _shadowSpreadRadius = 2.0;
const _shadowBlurRadius = 8.0;

class SprintProperties extends ConsumerWidget {
  const SprintProperties({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: theme.colors.background.primary,
        boxShadow: const [
          BoxShadow(
            spreadRadius: _shadowSpreadRadius,
            blurRadius: _shadowBlurRadius,
          ),
        ]
      ),
      child: Column(
        children: [
          const SprintTimer(),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SprintDistance()),
              Expanded(child: SprintTempo()),
            ],
          ),
          SizedBox(height: theme.dimensions.padding.small),
        ],
      ),
    );
  }
}
