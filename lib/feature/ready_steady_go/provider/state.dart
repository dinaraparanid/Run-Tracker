import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class ReadySteadyGoState with _$ReadySteadyGoState {
  const factory ReadySteadyGoState({
    required int countdown,
  }) = _ReadySteadyGoState;
}
