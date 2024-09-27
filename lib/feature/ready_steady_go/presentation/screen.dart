import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/core/ui/theme/app.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/ui/countdown.dart';
import 'package:run_tracker/feature/ready_steady_go/presentation/ui/road.dart';

final class ReadySteadyGoScreen extends ConsumerWidget {
  const ReadySteadyGoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: theme.colors.gradient.readySteadyGoBackground,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: theme.dimensions.padding.large,
                ),
                child: const ReadySteadyGoRoadBackground(),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: theme.dimensions.padding.extraEnormous,
                ),
                child: const ReadySteadyGoCountdown(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
