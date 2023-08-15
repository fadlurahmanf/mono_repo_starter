import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_onboarding/src/domain/common/_index.dart';
import 'package:mapp_onboarding/src/domain/repository/identity_repository.dart';
import 'package:mapp_onboarding/src/presentation/_index.dart';
import 'package:mapp_onboarding/src/presentation/splash/splash_bloc.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappOnBoarding extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    await c.isReady<IMappSqfliteStorage>();
    c
      ..registerLazySingleton<IIdentityRepository>(() =>
          IdentityRepository(identityApi: c.get<IIdentityApi>(), mappSqfliteStorage: c.get<IMappSqfliteStorage>()))
      ..registerFactory<SplashBloc>(() => SplashBloc(identityRepository: c.get<IIdentityRepository>()));
  }
}

class MappOnBoardingRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: MappOnBoardingRoute,
          screenType: SplashScreen,
          page: (context) => const SplashScreen().wrap(context),
          isFirstRoute: true,
        ),
        AppGetPage(
          moduleType: MappOnBoardingRoute,
          screenType: WelcomeScreen,
          page: (context) => const WelcomeScreen().wrap(context),
          isFirstRoute: false,
        ),
        AppGetPage(moduleType: MappOnBoardingRoute, screenType: TNCScreen, page: (context) => const TNCScreen()),
      ];
}
