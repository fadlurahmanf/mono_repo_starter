import 'package:logger/logger.dart';
import 'package:alice/alice.dart';

class AppLogger {
  Logger? logger;
  Alice? alice;

  AppLogger({this.logger, this.alice});

  void d(String message, {bool logInAlice = false}) {
    logger?.d(message);
  }

  void w(String message, {bool logInAlice = false}) {
    logger?.w(message);
  }
}
