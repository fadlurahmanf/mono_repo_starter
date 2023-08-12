import 'package:core/core.dart';
import 'package:core_applink/core_applink.dart';
import 'package:get_it/get_it.dart';

class AppLinkModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<IAppLinkRepository>(() => AppLinkRepository())
      ..registerFactory(() => AppLinkBloc(appLinkRepository: c.get<IAppLinkRepository>()));
  }
}
