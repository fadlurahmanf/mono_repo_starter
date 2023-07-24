import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

late CoreAppSettings _newCoreAppSettings;

Future<void> appRunner({required AppRunnerSetting settings}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerModules(c: settings.c, settings: settings);
  runApp(CoreApp(
    coreAppSettings: _newCoreAppSettings,
  ));
}

Future<void> _registerModules({required GetIt c, required AppRunnerSetting settings}) async {
  _newCoreAppSettings = settings.coreAppSettings;

  settings.appModuleSettings.appModule.setGlobalInjection(c);
  settings.appModuleSettings.appModule.registerAppSettings(c);
  settings.appModuleSettings.appModule.setLoggerAndAlice(c);

  settings.appModuleSettings.localizationModule.checkSupportedLanguage(c);
  settings.appModuleSettings.localizationModule.registerDependency(c);
  await _reInitLocalization(translationKeys: settings.appModuleSettings.localizationModule.getTranslationKeys());

  for (var element in settings.appModuleSettings.childModules) {
    element.registerDependency(c);
  }

  await _reInitPages(routeModules: settings.appModuleSettings.routeModules);

  c.registerLazySingleton<CoreAppSettings>(() => _newCoreAppSettings);
}

Future<void> _reInitPages({required List<RouteModule> routeModules}) async {
  final list = <GetPage<dynamic>>[];
  for (var module in routeModules) {
    for (var page in module.pages) {
      final pages = page.toGetPages();
      list.addAll(pages);
    }
  }
  _newCoreAppSettings = _newCoreAppSettings.copyWith(pages: list);
}

Future<void> _reInitLocalization({required Map<String, Map<String, String>> translationKeys}) async {
  _newCoreAppSettings = _newCoreAppSettings.copyWith(translationKeys: translationKeys);
}
