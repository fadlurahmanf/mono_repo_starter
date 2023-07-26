import 'dart:ui';
import 'package:core/core.dart';
import 'package:mapp_shared/mapp_shared.dart';

abstract class MappLocalizationModule extends LocalizationModule {
  @override
  Map<String, Map<String, String>> get translationMap => {
        'id_ID': {
          MappConstant.helloWorld: 'Halo Dunia',
        },
        'en_ID': {
          MappConstant.helloWorld: 'Hello world',
        },
      };

  @override
  List<Locale> get supportedLocales => [
        const Locale('id', 'ID'),
        const Locale('en', 'ID'),
      ];
}

class MappLocalizationDevModule extends MappLocalizationModule {
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

class MappLocalizationStagingModule extends MappLocalizationModule {}
