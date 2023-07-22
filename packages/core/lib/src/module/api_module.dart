import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

abstract class ApiModule extends BaseModule {
  @override
  void registerDependency(GetIt c) {
    registerApiSetting(c);
    registerBaseOption(c);
    registerDio(c);
  }

  void registerApiSetting(GetIt c);

  void registerBaseOption(GetIt c);

  void registerDio(GetIt c);
}