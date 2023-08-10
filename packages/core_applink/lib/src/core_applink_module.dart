import 'package:core/core.dart';
import 'package:core_applink/core_applink.dart';
import 'package:get_it/get_it.dart';

class CoreAppLinkModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<ICoreAppLinkRepository>(() => CoreAppLinkRepository())
      ..registerFactory(() => CoreAppLinkBloc(coreAppLinkRepository: c.get<ICoreAppLinkRepository>()));
  }
}
