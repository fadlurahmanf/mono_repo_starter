

import 'package:get_it/get_it.dart';
import 'base_module.dart';

abstract class AppConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    defineUnknownRoute();
    registerAppLogger(c);
  }

  void defineUnknownRoute();

  void registerAppLogger(GetIt c);
}
