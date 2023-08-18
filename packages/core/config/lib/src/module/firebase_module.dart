import 'package:get_it/get_it.dart';

import 'base_module.dart';

abstract class FirebaseModule extends BaseModule {
  Future<void> init();

  @override
  Future<void> registerDependency(GetIt c) async {
    await init();
  }
}
