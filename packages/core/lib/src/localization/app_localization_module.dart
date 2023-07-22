import 'dart:ui';

import 'package:core/src/localization/app_localization_settings.dart';
import 'package:core/src/localization/localization_bloc.dart';
import 'package:get_it/get_it.dart';

import '../module/app_module.dart';

class AppLocalizationModule extends LocalizationModule {
  final AppLocalizationSettings appLocalizationSettings;

  AppLocalizationModule({required this.appLocalizationSettings});

  @override
  void registerDependency(GetIt c) {
    c.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
  }

  @override
  void checkSupportedLanguage() {
    for (var element in appLocalizationSettings.supportedLocales) {
      if (!appLocalizationSettings.keys.containsKey('${element.languageCode}_${element.countryCode}')) {
        print("GA SUPPORT: ${element.languageCode}_${element.countryCode}");
      }
    }
  }
}
