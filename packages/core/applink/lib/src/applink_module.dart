import 'package:core_config/config.dart';
import 'package:core_applink/applink.dart';
import 'package:get_it/get_it.dart';

class AppLinkModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<IAppLinkRepository>(() => AppLinkRepository())
      ..registerFactory(() => AppLinkBloc(appLinkRepository: c.get<IAppLinkRepository>()));
  }
}
