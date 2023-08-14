import 'package:alice/alice.dart';
import 'package:core/core.dart';
import 'package:core/src/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class AppFactory {
  AppFactory._();

  static AppFactory? _instance;

  factory AppFactory() => _instance ??= AppFactory._();

  factory AppFactory.newInstance() => _instance ??= AppFactory._();

  static AppFactory get I => AppFactory();

  static AppFactory get instance => AppFactory();

  List<AppGetPage> routes = [];

  void addPage(AppGetPage p) {
    final transitions = <Transition>[
      Transition.fade,
      Transition.fadeIn,
      Transition.rightToLeft,
      Transition.leftToRight,
      Transition.upToDown,
      Transition.downToUp,
      Transition.rightToLeftWithFade,
      Transition.leftToRightWithFade,
      Transition.zoom,
      Transition.topLevel,
      Transition.noTransition,
      Transition.cupertino,
      Transition.cupertinoDialog,
      Transition.size,
      Transition.circularReveal,
      Transition.native,
    ];
    routes.add(p);
    for (var t in transitions) {
      routes.add(p.copyWith(transition: t));
    }
  }

  late GetIt getIt;

  void setInjection(GetIt getIt) {
    this.getIt = getIt;
  }

  late Map<String, Map<String, String>> translationMap;

  void setTranslationMap(Map<String, Map<String, String>> map) {
    translationMap = map;
  }

  void overrideSomeTranslationMap(Map<String, Map<String, String>> map) {
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

  Locale? defaultLocale;

  void setDefaultLocale(Locale locale) {
    defaultLocale = locale;
  }

  Alice? alice;

  late AppLogger appLogger;

  void setAppLogger(AppLogger appLogger) {
    this.appLogger = appLogger;
  }

  Logger? logger;

  late GlobalKey<NavigatorState> navigatorKey;

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    alice?.setNavigatorKey(navigatorKey);
    this.navigatorKey = navigatorKey;
  }

  GetPage<dynamic>? unknownRoute;

  void copyWith({
    Alice? alice,
    Logger? logger,
    Locale? defaultLocale,
    GetPage<dynamic>? unknownRoute,
  }) {
    this.alice = alice ?? this.alice;
    this.logger = logger ?? this.logger;
    this.defaultLocale = defaultLocale ?? this.defaultLocale;
    this.unknownRoute = unknownRoute ?? this.unknownRoute;
  }

  List<GetPage<dynamic>> onGenerateRoute(BuildContext context) {
    return routes
        .map((e) => GetPage(
              name: e.fullPath,
              page: () => e.page(context),
              transition: e.transition,
            ))
        .toList();
  }
}
