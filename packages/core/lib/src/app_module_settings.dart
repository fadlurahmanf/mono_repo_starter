import 'module/app_module.dart';

class AppModuleSettings {
  final AppModule appModule;
  final LocalizationModule localizationModule;
  final List<RouteModule> routeModules;
  final List<BaseModule> childModules;

  AppModuleSettings({
    required this.appModule,
    required this.localizationModule,
    required this.routeModules,
    required this.childModules,
  });
}
