import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final AppModuleSettings appModuleSettings;

  AppRunnerSetting({
    required this.c,
    required this.appModuleSettings,
  });
}
