import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_shared/mapp_shared.dart';

class MappShared extends BaseModule {
  @override
  void registerDependency(GetIt c) {
    c.registerLazySingleton<MappConstant>(() => MappConstant());
  }
}
