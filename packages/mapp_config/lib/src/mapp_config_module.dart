import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:firebase_core/firebase_core.dart';

class MappFirebaseModule extends FirebaseModule {
  @override
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}

abstract class MappConfigModule extends AppConfigModule {
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