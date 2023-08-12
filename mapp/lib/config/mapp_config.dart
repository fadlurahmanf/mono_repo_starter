import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_api_module.dart';
import 'package:mapp/config/mapp_api_settings.dart';
import 'package:mapp/config/mapp_localization_settings.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_config/mapp_config.dart';
import 'package:core_applink/core_applink.dart';

final _devRouteModules = <RouteModule>[
  MappOnBoardingRoutes(),
];

final _devModules = <BaseModule>[
  MappDevConfigModule(),
  MappLocalizationDevModule(),
  MappShared(),
  AppLinkModule(),
  MappStorage(),
  MappApiModule(
    settings: MappApiDevSettings(),
  ),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  appModuleSettings: AppModuleSettings(
    routeModules: _devRouteModules,
    childModules: _devModules,
  ),
  app: const MappApp(),
);
