import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_api_module.dart';
import 'package:mapp/config/mapp_api_settings.dart';
import 'package:mapp/config/mapp_app_module.dart';
import 'package:mapp/config/mapp_app_settings.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:flutter/material.dart';

final _devAppModules = <AppModule>[
  MappAppModule(settings: MappAppDevSettings()),
];

final _devModules = <BaseModule>[
  MappApiModule(
    settings: MappApiDevSettings(),
  ),
];

final _devRouteModules = <RouteModule>[
  MappOnBoardingRoutes(),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  coreAppSettings: CoreAppSettings(
    pages: [],
    unknownRoute: GetPage(
      name: '/unknown',
      page: () => const SizedBox.expand(),
    ),
  ),
  appModuleSettings: AppModuleSettings(
    appModules: _devAppModules,
    routeModules: _devRouteModules,
    childModules: _devModules,
  ),
);
