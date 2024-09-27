import 'package:run_tracker/domain/metrics/checkpoint.dart';

abstract class MetricsInteractor {
  double distance({
    required Checkpoint p1,
    required Checkpoint p2,
  });

  double speed({
    required Checkpoint p1,
    required Checkpoint p2,
  });
}
