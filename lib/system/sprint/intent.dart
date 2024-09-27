import 'package:freezed_annotation/freezed_annotation.dart';

part 'intent.freezed.dart';
part 'intent.g.dart';

@freezed
sealed class SprintTaskIntent with _$SprintTaskIntent {
  const SprintTaskIntent._();

  const factory SprintTaskIntent.pause() = PauseTaskIntent;
  const factory SprintTaskIntent.resume() = ResumeTaskIntent;
  const factory SprintTaskIntent.stop() = StopTaskIntent;

  const factory SprintTaskIntent.updateProgress({
    required int timeMillis,
    required double distanceMeters,
  }) = UpdateProgressIntent;

  factory SprintTaskIntent.fromJson(Map<String, dynamic> json) =>
      _$SprintTaskIntentFromJson(json);
}
