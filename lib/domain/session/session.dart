import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:run_tracker/domain/metrics/checkpoint.dart';
import 'package:run_tracker/utils/constants.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required int id,
    required DateTime date,
    required double distance,
    required Duration duration,
    required List<Checkpoint> checkpoints,
  }) = _Session;

  factory Session.create({
    required DateTime date,
    int? id,
    double? distance,
    Duration? duration,
    List<Checkpoint>? checkpoints,
  }) => Session(
    id: id ?? Random().nextInt(maxInt),
    date: date,
    distance: distance ?? 0,
    duration: duration ?? Duration.zero,
    checkpoints: checkpoints ?? [],
  );

  factory Session.fromJson(Map<String, dynamic> json) =>
    _$SessionFromJson(json);
}
