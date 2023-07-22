import 'package:logger/logger.dart';

class AppLogger {
  Logger? logger;

  AppLogger({this.logger});

  void d(String message, {bool logInAlice = false}) {
    logger?.d(message);
  }

  void w(String message, {bool logInAlice = false}) {
    logger?.w(message);
  }
}
