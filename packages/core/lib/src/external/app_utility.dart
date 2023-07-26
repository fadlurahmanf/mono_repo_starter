import 'package:alice/alice.dart';
import 'package:core/src/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

late GetIt _getIt;
Alice? _alice;
Logger? _logger;
late GlobalKey<NavigatorState> _getNavigatorKey;
late AppLogger _appLogger;
List<GetPage<dynamic>> _pages = [];
Map<String, Map<String, String>> _translation = {};
GetPage<dynamic>? _unknownRoute;
Locale? _defaultLocale;

class AppUtility {
  AppUtility._();

  static GetIt get getIt => _getIt;

  static setInjection(GetIt getIt) {
    _getIt = getIt;
  }

  static Alice? get alice => _alice;

  static setAlice(Alice alice) {
    _alice = alice;
  }

  static addNavigatorKeyToAlice(GlobalKey<NavigatorState> navigatorKey) {
    alice?.setNavigatorKey(navigatorKey);
    _getNavigatorKey = navigatorKey;
  }

  static GlobalKey<NavigatorState> get navigatorKey {
    if (alice?.getNavigatorKey() != null) {
      return alice!.getNavigatorKey()!;
    } else {
      return _getNavigatorKey;
    }
  }

  static Logger? get logger => _logger;

  static setLogger(Logger logger) {
    _logger = logger;
  }

  static AppLogger get appLogger => _appLogger;

  static setAppLogger(AppLogger appLogger) {
    _appLogger = appLogger;
  }

  static List<GetPage<dynamic>> get pages => _pages;

  static addPages(List<GetPage<dynamic>> pages) {
    AppUtility.pages.addAll(pages);
  }

  static addPage(GetPage<dynamic> page) {
    pages.add(page);
  }

  static Map<String, Map<String, String>> get translationMap => _translation;

  static setTranslationMap(Map<String, Map<String, String>> map) {
    _translation = map;
  }

  static overrideSomeTranslationMap(Map<String, Map<String, String>> map) {
    translationMap.forEach((keyLanguageCode, _) {
      final overridenKey = map.keys.toList().firstWhereOrNull((element) => element == keyLanguageCode);
      final overridenMap = map[overridenKey];
      if (overridenMap != null) {
        overridenMap.forEach((keyLanguage, valueLanguage) {
          translationMap[keyLanguageCode]?[keyLanguage] = valueLanguage;
          appLogger.i("OVERRIDEN KEY $keyLanguage in $keyLanguageCode to $valueLanguage");
        });
      }
    });
  }

  static GetPage<dynamic>? get unknownRoute => _unknownRoute;

  static setUnknownRoute(GetPage<dynamic> route) {
    _unknownRoute = route;
  }

  static Locale? get defaultLocale => _defaultLocale;

  static setDefaultLocale(Locale locale) {
    _defaultLocale = locale;
  }
}
