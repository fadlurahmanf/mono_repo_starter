import 'package:alice/alice.dart';
import 'package:core/src/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

late GetIt _getIt;
Alice? _alice;
Logger? _logger;
late GlobalKey<NavigatorState> _getNavigatorKey;
late AppLogger _appLogger;

class AppUtility {
  AppUtility._();

  static GetIt get getIt {
    return _getIt;
  }

  static setInjection(GetIt getIt) {
    _getIt = getIt;
  }

  static Alice? get alice {
    return _alice;
  }

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

  static Logger? get logger {
    return _logger;
  }

  static setLogger(Logger logger) {
    _logger = logger;
  }

  static AppLogger get appLogger {
    return _appLogger;
  }

  static setAppLogger(AppLogger appLogger) {
    _appLogger = appLogger;
  }
}
