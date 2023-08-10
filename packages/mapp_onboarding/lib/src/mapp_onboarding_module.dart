import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_onboarding/src/presentation/_index.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';
import 'package:mapp_onboarding/src/presentation/welcome_screen.dart';

class MappOnBoarding extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {}
}

class MappOnBoardingRoutes extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: MappOnBoardingRoutes,
          screenType: SplashScreen,
          page: (context) => const SplashScreen(),
          firstRoute: false
        ),
        AppGetPage(
          moduleType: MappOnBoardingRoutes,
          screenType: WelcomeScreen,
          page: (context) => const WelcomeScreen().wrap(context),
          firstRoute: true
        ),
        AppGetPage(moduleType: MappOnBoardingRoutes, screenType: TNCScreen, page: (context) => const TNCScreen()),
      ];
}
