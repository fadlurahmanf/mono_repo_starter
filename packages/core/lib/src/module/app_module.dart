import 'package:core/src/app_settings.dart';
import 'package:core/src/logger/app_logger.dart';
import 'package:core/src/route/app_get_page.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class AppModule extends BaseModule {
  AppSettings appSettings;

  AppModule({required this.appSettings});

  @override
  void registerDependency(GetIt c) {
    _registerAppSettings(c);
    _registerLogger(c);
  }

  void _registerAppSettings(GetIt c) {
    c.registerLazySingleton<AppSettings>(() => appSettings);
  }

  void _registerLogger(GetIt c) {
    if (appSettings.useLog == true) {
      c.registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));
    }

    Logger? logger;
    if (c.isRegistered<Logger>()) {
      logger = c.get<Logger>();
    }

    c.registerLazySingleton<AppLogger>(() => AppLogger(logger: logger));
  }
}

abstract class RouteModule {
  List<AppGetPage> get pages;
}

abstract class LocalizationModule extends BaseModule {
  void checkSupportedLanguage(GetIt c);
}

abstract class BaseModule {
  void registerDependency(GetIt c);
}
