import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_api_module.dart';
import 'package:mapp/config/mapp_api_settings.dart';
import 'package:mapp/config/mapp_app_module.dart';
import 'package:mapp/config/mapp_app_settings.dart';
import 'package:mapp/config/mapp_core_app_settings.dart';
import 'package:mapp/config/mapp_localization_settings.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_storage/mapp_storage.dart';

final _devAppModules = MappAppModule(settings: MappAppDevSettings());

final _devLocalizationModule = AppLocalizationModule(
  appLocalizationSettings: MappLocalizationSettings(),
);

final _devRouteModules = <RouteModule>[
  MappOnBoardingRoutes(),
];

final _devModules = <BaseModule>[
  MappStorage(),

  MappApiModule(
    settings: MappApiDevSettings(),
  ),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  coreAppSettings: MappCoreAppSettings(),
  appModuleSettings: AppModuleSettings(
    appModule: _devAppModules,
    routeModules: _devRouteModules,
    childModules: _devModules,
    localizationModule: _devLocalizationModule,
  ),
);
