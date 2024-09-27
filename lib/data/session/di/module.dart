import 'package:get_it/get_it.dart';
import 'package:run_tracker/data/session/repository.dart';
import 'package:run_tracker/domain/session/repository.dart';

extension SessionModule on GetIt {
  void registerSessionModule() =>
    registerLazySingleton<SessionRepository>(() => SessionRepositoryImpl(this()));
}
