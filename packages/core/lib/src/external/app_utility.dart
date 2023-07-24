import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

late GetIt _getIt;
Alice? _alice;
Logger? _logger;
late GlobalKey<NavigatorState> _navigatorKey;

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
  }

  static Logger? get logger {
    return _logger;
  }

  static setLogger(Logger logger) {
    _logger = logger;
  }
}
