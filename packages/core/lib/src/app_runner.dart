import 'package:core/core.dart';
import 'package:core/src/external/app_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

late CoreAppSettings _newCoreAppSettings;

Future<void> appRunner({required AppRunnerSetting settings}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUtility.setContainer(getIt: settings.c);
  _newCoreAppSettings = settings.coreAppSettings;
  await _registerModules(c: settings.c, appModuleSettings: settings.appModuleSettings);
  runApp(CoreApp(
    coreAppSettings: _newCoreAppSettings,
  ));
}

Future<void> _registerModules({required GetIt c, required AppModuleSettings appModuleSettings}) async {
  for (var element in appModuleSettings.appModules) {
    element.registerDependency(c);
  }

  appModuleSettings.localizationModule.checkSupportedLanguage(c);
  appModuleSettings.localizationModule.registerDependency(c);

  for (var element in appModuleSettings.childModules) {
    element.registerDependency(c);
  }

  await _reCreateCoreAppSetting(routeModules: appModuleSettings.routeModules);
}

Future<void> _reCreateCoreAppSetting({required List<RouteModule> routeModules}) async {
  final list = <GetPage<dynamic>>[];
  for (var module in routeModules) {
    for (var page in module.pages) {
      final pages = page.toGetPages();
      list.addAll(pages);
    }
  }
  _newCoreAppSettings = _newCoreAppSettings.copyWith(pages: list);
}
