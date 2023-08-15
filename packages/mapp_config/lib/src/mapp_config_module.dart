import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_config/src/data/repositories/i_mapp_notification_repository.dart';
import 'package:mapp_config/src/data/repositories/mapp_notification_repository.dart';
import 'package:mapp_config/src/domain/_index.dart';
import 'package:mapp_config/src/domain/repository/mapp_repository.dart';
import 'package:mapp_config/src/presentation/unknown/unknown_screen.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_config/src/presentation/app/mapp_bloc.dart';

class MappConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<IMappNotificationRepository>(() => MappNotificationRepository())
      ..registerLazySingleton<IMappRepository>(() => MappRepository(mappSqfliteStorage: c.get<IMappSqfliteStorage>()))
      ..registerLazySingleton<MappBloc>(
          () => MappBloc(mappRepository: c.get<IMappRepository>(), appLogger: c.get<AppLogger>()));
  }
}

class MappFirebaseModule extends FirebaseModule {
  @override
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}

class MappConfigRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: MappConfigRoute,
          screenType: UnknownScreen,
          page: (context) => const UnknownScreen().wrap(context),
          isUnknown: true,
        )
      ];
}

abstract class MappAppConfigModule extends AppConfigModule {}

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
