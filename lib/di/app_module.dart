import 'package:get_it/get_it.dart';
import 'package:run_tracker/data/di/module.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  void registerAppModule() => registerDataModule();
}
