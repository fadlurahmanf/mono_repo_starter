import 'package:core/core.dart';
import 'package:mapp_example/src/_index.dart';

class MappExampleRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: ExampleScreen,
          page: (context) => const ExampleScreen(),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: SwitchLanguageScreen,
          page: (context) => const SwitchLanguageScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: NotificationScreen,
          page: (context) => const NotificationScreen().wrap(context),
        ),
      ];
}
