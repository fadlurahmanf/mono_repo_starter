import 'package:alice/alice.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:km/config/km_app_settings.dart';
import 'package:logger/logger.dart';

abstract class KmAppModule extends AppModule {
  KmAppSettings settings;

  KmAppModule({required this.settings});

  @override
  Future<void> registerAppSettings(GetIt c) async {
    c
      ..registerLazySingleton<AppSettings>(() => settings)
      ..registerLazySingleton<KmAppSettings>(() => settings);
  }

  @override
  Future<void> setGlobalUnknownRoute() async {
    AppUtility.setUnknownRoute(GetPage(
      name: '/unknown',
      page: () => const SizedBox.expand(),
    ));
  }
}

class KmAppDevModule extends KmAppModule {
  KmAppDevModule({required super.settings});

  @override
  Future<void> registerAppSettings(GetIt c) async {
    c
      ..registerLazySingleton<AppSettings>(() => settings)
      ..registerLazySingleton<KmAppSettings>(() => settings);
  }

  @override
  Future<void> setGlobalLoggerAndAlice(GetIt c) async {
    Logger? logger;
    if (settings.useLog == true) {
      logger = Logger(printer: PrettyPrinter());
      AppUtility.setLogger(logger);
    }
    Alice? alice;
    if (settings.useAlice == true) {
      alice = Alice(showInspectorOnShake: true);
      AppUtility.setAlice(alice);
    }

    final appLogger = AppLogger(logger: logger, alice: alice);
    AppUtility.setAppLogger(appLogger);

    c.registerLazySingleton(() => appLogger);
  }
}

class KmAppStagingModule extends KmAppModule {
  KmAppStagingModule({required super.settings});

  @override
  Future<void> setGlobalLoggerAndAlice(GetIt c) async {
    // no need to install logger in staging
  }
}
