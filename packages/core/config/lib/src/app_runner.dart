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
  print("START REGISTER: ${DateTime.now().toString()}");
  await Future.forEach(childModules, (element) async {
    await element.registerDependency(c);
  });
  print("END REGISTER: ${DateTime.now().toString()}");

  print("START PAGE: ${DateTime.now().toString()}");
  await Future.forEach(routeModules, (element) async {
    await element.addPages();
  });
  print("END PAGE: ${DateTime.now().toString()}");
}
