import 'package:core/core.dart';
import 'package:core/src/localization/localization_bloc.dart';
import 'package:core/src/storage/core_sqflite_db_repository.dart';
import 'package:core/src/storage/core_sqflite_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class AppModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    await registerAppSettings(c);
    await _setGlobalInjection(c);
    await setGlobalLoggerAndAlice(c);
    await _registerAppStorage(c);
  }

  Future<void> registerAppSettings(GetIt c);

  Future<void> _setGlobalInjection(GetIt c) async {
    AppUtility.setInjection(c);
  }

  Future<void> setGlobalLoggerAndAlice(GetIt c);

  Future<void> setGlobalUnknownRoute();

  Future<void> _registerAppStorage(GetIt c) async {
    c
      ..registerLazySingleton<CoreSqfliteDBRepository>(() => CoreSqfliteDBRepository())
      ..registerSingletonAsync<CoreSqfliteStorage>(
          () async => CoreSqfliteStorage(db: await c.get<CoreSqfliteDBRepository>().openDB()));
  }
}

abstract class RouteModule {
  List<AppGetPage> get pages;

  Future<void> addPages() async {
    for (var page in pages) {
      final pages = page.toGetPages();
      AppUtility.addPages(pages);
    }
  }
}

abstract class LocalizationModule extends BaseModule {
  Future<void> checkSupportedLanguage() async {
    for (var element in supportedLocales) {
      if (!translationMap.containsKey('${element.languageCode}_${element.countryCode}')) {
        AppUtility.appLogger.w("DIDN'T SUPPORT LANGUAGE -> ${element.languageCode}_${element.countryCode}");
      }
    }
  }

  @override
  Future<void> registerDependency(GetIt c) async {
    await c.isReady<CoreSqfliteStorage>();
    c.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc(coreStorage: c.get<CoreSqfliteStorage>()));
    await checkSupportedLanguage();
    await setGlobalTranslationMap();
    await setDefaultLocale();
  }

  Future<void> setGlobalTranslationMap() async {
    AppUtility.setTranslationMap(translationMap);
    AppUtility.overrideSomeTranslationMap(overrideTranslationMap);
  }

  Map<String, Map<String, String>> get translationMap;

  Map<String, Map<String, String>> get overrideTranslationMap => {};

  List<Locale> get supportedLocales;

  Future<void> setDefaultLocale() async {
    if (supportedLocales.isNotEmpty) {
      AppUtility.setDefaultLocale(supportedLocales.first);
    }
  }
}

abstract class BaseModule {
  Future<void> registerDependency(GetIt c);
}
