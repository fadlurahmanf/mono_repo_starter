import 'package:core/core.dart';
import 'package:core/src/external/app_utility.dart';
import 'package:core/src/external/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

Future<void> appRunner({required AppRunnerSetting settings}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUtility.setContainer(getIt: settings.c);
  await _registerModules(c: settings.c, appModuleSettings: settings.appModuleSettings);
  final newCoreAppSettings = await reCreateCoreAppSetting(
      coreAppSettings: settings.coreAppSettings, routeModules: settings.appModuleSettings.routeModules);
  runApp(CoreApp(
    coreAppSettings: newCoreAppSettings,
  ));
}

Future<CoreAppSettings> reCreateCoreAppSetting(
    {required CoreAppSettings coreAppSettings, required List<RouteModule> routeModules}) async {
  final list = <GetPage<dynamic>>[];
  for (var module in routeModules) {
    for (var page in module.pages) {
      final pages = page.toGetPages();
      list.addAll(pages);
    }
  }
  return coreAppSettings.copyWith(pages: list);
}

Future<void> _registerModules({required GetIt c, required AppModuleSettings appModuleSettings}) async {
  for (var element in appModuleSettings.appModules) {
    element.registerAppSettings(c);
  }

  for (var element in appModuleSettings.childModules) {
    element.registerDependency(c);
  }
}
