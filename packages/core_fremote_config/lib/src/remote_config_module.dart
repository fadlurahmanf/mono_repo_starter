import 'package:core/core.dart';
import 'package:core_fremote_config/src/domain/common/_index.dart';
import 'package:core_fremote_config/src/domain/repository/_index.dart';
import 'package:get_it/get_it.dart';

class RemoteConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<IRemoteConfigRepository>(() => RemoteConfigRepository());
  }
}
