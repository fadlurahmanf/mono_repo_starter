import 'package:core/src/app_settings.dart';
import 'package:core/src/route/app_get_page.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

abstract class AppModule {
  AppSettings appSettings;

  AppModule({required this.appSettings});

  void registerAppSettings(GetIt c) {
    c.registerLazySingleton<AppSettings>(() => appSettings);
  }
}

abstract class RouteModule {
  List<AppGetPage> get pages;
}

abstract class BaseModule {
  void registerDependency(GetIt c);
}
