import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

@immutable
enum Theme {
  dark, light;

  factory Theme.system() =>
    switch (SchedulerBinding.instance.platformDispatcher.platformBrightness) {
      Brightness.dark => Theme.dark,
      Brightness.light => Theme.light,
    };
}
