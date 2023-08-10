import 'dart:ui';

import 'package:alice/alice.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:mapp_config/src/mapp_config_module.dart';

class MappDevConfigModule extends MappConfigModule {
  @override
  void registerAppLogger(GetIt c) {
    Logger logger = Logger(printer: PrettyPrinter());

    Alice alice = Alice(showInspectorOnShake: true);
    alice.setNavigatorKey(Get.key);

    final appLogger = AppLogger(logger: logger, alice: alice);

    AppFactory.I.copyWith(logger: logger, alice: alice);
    AppFactory.I.setAppLogger(appLogger);
    AppFactory.I.setNavigatorKey(alice.getNavigatorKey() ?? Get.key);

    c.registerLazySingleton(() => appLogger);
  }
}

class MappDevLocalizationModule extends MappLocalizationModule {
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
