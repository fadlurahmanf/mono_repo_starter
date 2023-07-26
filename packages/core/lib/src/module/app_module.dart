import 'package:core/core.dart';
import 'package:core/src/localization/localization_bloc.dart';
import 'package:core/src/storage/core_sqflite_db_repository.dart';
import 'package:core/src/storage/core_sqflite_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class AppModule extends BaseModule {
  @override
  void registerDependency(GetIt c) {
    registerAppSettings(c);
    _setGlobalInjection(c);
    setGlobalLoggerAndAlice(c);
    _registerAppStorage(c);
  }

  void registerAppSettings(GetIt c);

  void _setGlobalInjection(GetIt c) {
    AppUtility.setInjection(c);
  }

  void setGlobalLoggerAndAlice(GetIt c);

  void setGlobalUnknownRoute();

  void _registerAppStorage(GetIt c) {
    c
      ..registerLazySingleton<CoreSqfliteDBRepository>(() => CoreSqfliteDBRepository())
      ..registerSingletonAsync<CoreSqfliteStorage>(
          () async => CoreSqfliteStorage(db: await c.get<CoreSqfliteDBRepository>().openDB()));
  }
}

abstract class RouteModule {
  List<AppGetPage> get pages;

  void addPages() {
    for (var page in pages) {
      final pages = page.toGetPages();
      AppUtility.addPages(pages);
    }
  }
}

abstract class LocalizationModule extends BaseModule {
  void checkSupportedLanguage() {
    for (var element in supportedLocales) {
      if (!translationMap.containsKey('${element.languageCode}_${element.countryCode}')) {
        AppUtility.appLogger.w("DIDN'T SUPPORT LANGUAGE -> ${element.languageCode}_${element.countryCode}");
      }
    }
  }

  @override
  void registerDependency(GetIt c) {
    c.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc(coreStorage: c.get<CoreSqfliteStorage>()));
    checkSupportedLanguage();
    setGlobalTranslationMap();
    setDefaultLocale();
  }

  void setGlobalTranslationMap() {
    AppUtility.setTranslationMap(translationMap);
    AppUtility.overrideSomeTranslationMap(overrideTranslationMap);
  }

  Map<String, Map<String, String>> get translationMap;

  Map<String, Map<String, String>> get overrideTranslationMap => {};

  List<Locale> get supportedLocales;

  void setDefaultLocale() {
    if (supportedLocales.isNotEmpty) {
      AppUtility.setDefaultLocale(supportedLocales.first);
    }
  }
}

abstract class BaseModule {
  void registerDependency(GetIt c);
}
