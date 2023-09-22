

import 'package:get_it/get_it.dart';
import 'base_module.dart';

abstract class AppConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    registerAppLogger(c);
  }

  void registerAppLogger(GetIt c);
}
