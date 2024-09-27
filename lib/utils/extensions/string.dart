import 'dart:math';

extension Utils on String {
  String take(int n) => substring(0, min(n, length));
}