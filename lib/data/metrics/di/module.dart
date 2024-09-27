import 'package:get_it/get_it.dart';
import 'package:run_tracker/data/metrics/interactor.dart';
import 'package:run_tracker/domain/metrics/interactor.dart';

extension MetricsModule on GetIt {
  void registerMetricsModule() =>
    registerLazySingleton<MetricsInteractor>(() => MetricsInteractorImpl());
}
