import 'app_module.dart';

class AppModuleSettings {
  final List<BaseModule> childModules;
  final List<RouteModule> routeModules;

  AppModuleSettings({
    required this.childModules,
    required this.routeModules,
  });
}
