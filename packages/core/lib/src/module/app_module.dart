import 'package:alice/alice.dart';
import 'package:core/core.dart';
import 'package:core/src/app_settings.dart';
import 'package:core/src/external/app_utility.dart';
import 'package:core/src/route/app_get_page.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class AppModule {
  AppSettings appSettings;

  AppModule({required this.appSettings});

  void setGlobalInjection(GetIt c) {
    AppUtility.setInjection(c);
  }

  void registerAppSettings(GetIt c) {
    c.registerLazySingleton<AppSettings>(() => appSettings);
  }

  void setLoggerAndAlice(GetIt c) {
    Logger? _logger;
    if (appSettings.useLog == true) {
      _logger = Logger(printer: PrettyPrinter());
      AppUtility.setLogger(_logger);
    }

    Alice? _alice;
    if (appSettings.useAlice == true) {
      _alice = Alice(showInspectorOnShake: true);
      AppUtility.setAlice(_alice);
    }

    final appLogger = AppLogger(logger: _logger, alice: _alice);
    AppUtility.setAppLogger(appLogger);
    c.registerLazySingleton(() => appLogger);
  }
}

abstract class RouteModule {
  List<AppGetPage> get pages;
}

abstract class LocalizationModule extends BaseModule {
  void checkSupportedLanguage(GetIt c);
  Map<String, Map<String, String>> getTranslationKeys();
}

abstract class BaseModule {
  void registerDependency(GetIt c);
}
