import 'package:get_it/get_it.dart';

import 'base_module.dart';

abstract class ApiModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    await registerBaseOption(c);
    await registerDio(c);
    await registerApi(c);
  }

  Future<void> registerBaseOption(GetIt c);

  Future<void> registerDio(GetIt c);

  Future<void> registerApi(GetIt c);
}