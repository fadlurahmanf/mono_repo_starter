import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

Future<void> appRunner({required AppRunnerSetting settings}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerModules(c: settings.c, settings: settings);
  runApp(const CoreApp());
}

Future<void> _registerModules({required GetIt c, required AppRunnerSetting settings}) async {
  for (var element in settings.appModuleSettings.childModules) {
    element.registerDependency(c);
  }

  for (var element in settings.appModuleSettings.routeModules) {
    element.addPages();
  }
}
