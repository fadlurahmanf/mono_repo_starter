import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class BaseModule {
  Future<void> registerDependency(GetIt c);
}

abstract class AppConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    defineUnknownRoute();
    registerAppLogger(c);
  }

  void defineUnknownRoute();

  void registerAppLogger(GetIt c);
}

abstract class RouteModule {
  List<AppGetPage> get pages;

  Future<void> addPages() async {
    for (var page in pages) {
      AppFactory.I.addPage(page);
    }
  }
}

abstract class LocalizationModule extends BaseModule {
  Map<String, Map<String, String>> get translationMap;

  Map<String, Map<String, String>> get overrideTranslationMap => {};

  List<Locale> get supportedLocales;

  @override
  Future<void> registerDependency(GetIt c) async {
    checkSupportedLanguage();
    setGlobalTranslationMap();
    setDefaultLocale();
    c.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
  }

  void checkSupportedLanguage() async {
    for (var element in supportedLocales) {
      if (!translationMap.containsKey('${element.languageCode}_${element.countryCode}')) {
        AppFactory.I.appLogger.w("DIDN'T SUPPORT LANGUAGE -> ${element.languageCode}_${element.countryCode}");
      }
    }
  }

  Future<void> setGlobalTranslationMap() async {
    AppFactory.I.setTranslationMap(translationMap);
    AppFactory.I.overrideSomeTranslationMap(overrideTranslationMap);
  }

  Future<void> setDefaultLocale() async {
    if (supportedLocales.isNotEmpty) {
      AppFactory.I.setDefaultLocale(supportedLocales.first);
    } else {
      AppFactory.I.appLogger.w("SUPPORTED LOCALE EMPTY");
    }
  }
}

abstract class ApiModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    await registerApiSetting(c);
    await registerBaseOption(c);
    await registerDio(c);
  }

  Future<void> registerApiSetting(GetIt c);

  Future<void> registerBaseOption(GetIt c);

  Future<void> registerDio(GetIt c);
}

abstract class FirebaseModule {
  Future<void> init();
}
