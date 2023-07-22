import 'dart:ui';
import 'package:core/core.dart';

class MappLocalizationSettings extends AppLocalizationSettings {
  @override
  Map<String, Map<String, String>> get keys => {
    'ids_ID': {
      'hello_world': 'Halo Dunia',
    }, 'en_ID': {
      'hello_world': 'Hello World',
    },
  };

  @override
  List<Locale> get supportedLocales => [
        const Locale('id', 'ID'),
        const Locale('en', 'ID'),
      ];
}
