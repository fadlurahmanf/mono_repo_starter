import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_localization_settings.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_config/mapp_config.dart';
import 'package:core_applink/core_applink.dart';
import 'package:mapp_notification/mapp_notification.dart';
import 'package:mapp_example/mapp_example.dart';

final _devRouteModules = <RouteModule>[
  MappExampleRoute(),
  MappOnBoardingRoutes(),
];

final _devModules = <BaseModule>[
  MappDevConfigModule(),
  MappLocalizationDevModule(),
  MappShared(),
  MappNotificationModule(),
  AppLinkModule(),
  MappStorage(),
  MappApiDevModule(
    settings: MappApiDevSettings(),
  ),
  MappConfigModule(),
  MappOnBoarding(),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  firebaseModule: MappFirebaseModule(),
  childModules: _devModules,
  routeModules: _devRouteModules,
  app: const MappApp(),
);
