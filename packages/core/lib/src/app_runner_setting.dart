import 'package:core/core.dart';
import 'package:core/src/presentation/core_app_settings.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final CoreAppSettings coreAppSettings;
  final AppModuleSettings appModuleSettings;

  AppRunnerSetting({
    required this.c,
    required this.coreAppSettings,
    required this.appModuleSettings,
  });
}
