import 'package:core_config/config.dart';
import 'package:mapp_example/src/_index.dart';
import 'package:mapp_example/src/presentation/locator/_index.dart';
import 'package:mapp_example/src/presentation/storage/_index.dart';

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
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: StorageScreen,
          page: (context) => const StorageScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: LocatorScreen,
          page: (context) => const LocatorScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: FaceDetectionScreen,
          page: (context) => const FaceDetectionScreen().wrap(context),
        ),
      ];
}
