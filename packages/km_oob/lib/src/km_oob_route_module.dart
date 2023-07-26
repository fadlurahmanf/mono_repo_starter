import 'package:core/core.dart';
import 'package:km_oob/src/presentation/register/register_screen.dart';

class KmOobRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: KmOobRoute,
          screenType: RegisterScreen,
          page: () => const RegisterScreen(),
        ),
      ];
}
