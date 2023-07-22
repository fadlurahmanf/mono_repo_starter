import 'package:core/core.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';
import 'package:mapp_onboarding/src/presentation/welcome_screen.dart';

class MappOnBoardingRoutes extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(moduleType: MappOnBoardingRoutes, screenType: WelcomeScreen, page: () => const WelcomeScreen()),
        AppGetPage(moduleType: MappOnBoardingRoutes, screenType: TNCScreen, page: () => const TNCScreen()),
      ];
}
