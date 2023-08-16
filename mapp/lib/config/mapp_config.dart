import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_fcm/mapp_fcm.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_config/mapp_config.dart';
import 'package:core_applink/applink.dart';
import 'package:mapp_example/mapp_example.dart';
import 'package:core_locator/locator.dart';

final _devRouteModules = <RouteModule>[
  MappConfigRoute(),
  MappOnBoardingRoute(),
  MappExampleRoute(),
];

final _devModules = <BaseModule>[
  AppLinkModule(),
  LocatorModule(),
  MappFirebaseModule(),
  MappDevConfigModule(),
  MappDevLocalizationModule(),
  MappShared(),
  MappFCMModule(),
  MappStorage(),
  MappApiDevModule(
    settings: MappApiDevSettings(),
  ),
  MappConfigModule(),
  MappOnBoarding(),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  childModules: _devModules,
  routeModules: _devRouteModules,
  app: const MappApp(),
);
