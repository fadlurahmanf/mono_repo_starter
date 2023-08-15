import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:alice/alice.dart';

class AppLogger {
  Logger? logger;
  Alice? alice;

  AppLogger({this.logger, this.alice});

  void d(String message, {bool logInAlice = false}) {
    logger?.d(message);
    if (logInAlice == true) {
      alice?.addLog(AliceLog(message: message, level: DiagnosticLevel.debug));
    }
  }

  void e(String message, {bool logInAlice = false}) {
    logger?.e(message);
    if (logInAlice == true) {
      alice?.addLog(AliceLog(message: message, level: DiagnosticLevel.error));
    }
  }

  void w(String message, {bool logInAlice = false}) {
    logger?.w(message);
    if (logInAlice == true) {
      alice?.addLog(AliceLog(message: message, level: DiagnosticLevel.warning));
    }
  }

  void i(String message, {bool logInAlice = false}) {
    logger?.i(message);
    if (logInAlice == true) {
      alice?.addLog(AliceLog(message: message, level: DiagnosticLevel.info));
    }
  }

  void wtf(String message, {bool logInAlice = false}) {
    logger?.wtf(message);
    if (logInAlice == true) {
      alice?.addLog(AliceLog(message: message, level: DiagnosticLevel.error));
    }
  }
}
