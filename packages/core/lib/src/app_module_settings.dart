import 'module/app_module.dart';

class AppModuleSettings {
  final AppModule appModule;
  final List<RouteModule> routeModules;
  final List<BaseModule> childModules;
  final LocalizationModule localizationModule;

  AppModuleSettings({
    required this.appModule,
    required this.routeModules,
    required this.childModules,
    required this.localizationModule,
  });
}
