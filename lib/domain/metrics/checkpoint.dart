import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkpoint.freezed.dart';
part 'checkpoint.g.dart';

@freezed
abstract class Checkpoint with _$Checkpoint {
  const factory Checkpoint({
    required double latitude,
    required double longitude,
    required int timestampMs,
  }) = _Checkpoint;

  factory Checkpoint.fromJson(Map<String, dynamic> json) =>
    _$CheckpointFromJson(json);
}
