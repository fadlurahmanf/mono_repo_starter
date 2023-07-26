import 'package:alice/alice.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mapp/config/mapp_app_settings.dart';

abstract class MappAppModule extends AppModule {
  MappAppSettings settings;

  MappAppModule({required this.settings});

  @override
  void registerAppSettings(GetIt c) {
    c
      ..registerLazySingleton<AppSettings>(() => settings)
      ..registerLazySingleton<MappAppSettings>(() => settings);
  }

  @override
  void setGlobalUnknownRoute() {
    AppUtility.setUnknownRoute(GetPage(
      name: '/unknown',
      page: () => const SizedBox.expand(),
    ));
  }
}

class MappAppDevModule extends MappAppModule {
  MappAppDevModule({required super.settings});

  @override
  void registerAppSettings(GetIt c) {
    c
      ..registerLazySingleton<AppSettings>(() => settings)
      ..registerLazySingleton<MappAppSettings>(() => settings);
  }

  @override
  void setGlobalLoggerAndAlice(GetIt c) {
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

class MappAppStagingModule extends MappAppModule {

  MappAppStagingModule({required super.settings});

  @override
  void setGlobalLoggerAndAlice(GetIt c) {
    // no need to install logger in staging
  }
}
