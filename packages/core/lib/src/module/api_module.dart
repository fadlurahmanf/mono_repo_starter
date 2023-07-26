import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

abstract class ApiModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    await registerApiSetting(c);
    await registerBaseOption(c);
    await registerDio(c);
  }

  Future<void> registerApiSetting(GetIt c);

  Future<void> registerBaseOption(GetIt c);

  Future<void> registerDio(GetIt c);
}