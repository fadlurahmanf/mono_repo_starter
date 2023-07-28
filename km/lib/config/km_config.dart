import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:km/config/km_app_module.dart';
import 'package:km/config/km_app_settings.dart';
import 'package:km/config/km_localization_module.dart';
import 'package:km_oob/km_oob.dart';
import 'package:km_shared/km_shared.dart';
import 'package:km_storage/km_storage.dart';

final _devRouteModules = <RouteModule>[
  KmOobRoute(),
];

final _devModules = <BaseModule>[
  KmAppDevModule(settings: KmAppDevSettings()),
  KmLocalizationDevModule(),
  KmShared(),
  KmStorage(),
  // MappApiModule(
  //   settings: MappApiDevSettings(),
  // ),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  appModuleSettings: AppModuleSettings(
    routeModules: _devRouteModules,
    childModules: _devModules,
  ),
);
