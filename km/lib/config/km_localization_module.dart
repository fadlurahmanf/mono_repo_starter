import 'dart:ui';
import 'package:core/core.dart';
import 'package:km_shared/km_shared.dart';

abstract class KmLocalizationModule extends LocalizationModule {
  @override
  Map<String, Map<String, String>> get translationMap => {
        'id_ID': {
          KmConstant.helloWorld: 'Halo Dunia',
        },
        'en_ID': {
          KmConstant.helloWorld: 'Hello world',
        },
      };

  @override
  List<Locale> get supportedLocales => [
        const Locale('id', 'ID'),
        const Locale('en', 'ID'),
      ];
}

class KmLocalizationDevModule extends KmLocalizationModule {
  @override
  Map<String, Map<String, String>> get overrideTranslationMap => {
        'id_ID': {
          'hello': 'Halo overriden indonesia',
        },
        'en_ID': {
          'hello': 'Halo overriden english',
        }
      };
}

class KmLocalizationStagingModule extends KmLocalizationModule {}
