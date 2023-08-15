import 'package:core_config/config.dart';
import 'package:km_oob/src/presentation/login/splash_screen.dart';
import 'package:km_oob/src/presentation/register/register_screen.dart';

class KmOobRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: KmOobRoute,
          screenType: SplashScreen,
          page: () => const SplashScreen(),
        ),
        AppGetPage(
          moduleType: KmOobRoute,
          screenType: RegisterScreen,
          page: () => const RegisterScreen(),
        ),
      ];
}
