import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../external/app_factory.dart';
import '../localization/localization_bloc.dart';
import 'base_module.dart';

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
      AppFactory.I.appLogger.e("SUPPORTED LOCALE EMPTY");
    }
  }
}