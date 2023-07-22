import 'module/app_module.dart';

class AppModuleSettings {
  final List<AppModule> appModules;
  final List<RouteModule> routeModules;
  final List<BaseModule> childModules;

  AppModuleSettings({required this.appModules, required this.routeModules, required this.childModules});
}
