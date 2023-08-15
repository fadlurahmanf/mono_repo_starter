import 'package:core_config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

Future<void> appRunner({required AppRunnerSetting settings}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerModules(c: settings.c, childModules: settings.childModules, routeModules: settings.routeModules);
  runApp(settings.app);
}

Future<void> _registerModules({
  required GetIt c,
  required List<BaseModule> childModules,
  required List<RouteModule> routeModules,
}) async {
  AppFactory.I.setInjection(c);

  for (var element in childModules) {
    await element.registerDependency(c);
  }

  for (var element in routeModules) {
    await element.addPages();
  }
}
