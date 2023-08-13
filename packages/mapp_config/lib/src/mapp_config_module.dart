import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_config/src/domain/_index.dart';
import 'package:mapp_config/src/domain/repository/mapp_repository.dart';
import 'package:mapp_config/src/presentation/mapp_bloc.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappConfigModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<IMappRepository>(() => MappRepository(mappSqfliteStorage: c.get<IMappSqfliteStorage>()))
      ..registerLazySingleton(() => MappBloc(mappRepository: c.get<IMappRepository>()));
  }
}

class MappFirebaseModule extends FirebaseModule {
  @override
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}

abstract class MappAppConfigModule extends AppConfigModule {
  @override
  void defineUnknownRoute() {
    AppFactory.I.copyWith(
      unknownRoute: GetPage(
        name: '/unknown',
        page: () => const SizedBox.expand(),
      ),
    );
  }
}

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
