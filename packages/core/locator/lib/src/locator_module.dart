import 'package:core_config/config.dart';
import 'package:core_locator/locator.dart';
import 'package:get_it/get_it.dart';

class LocatorModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<ILocatorRepository>(() => LocatorRepository());
  }
}
