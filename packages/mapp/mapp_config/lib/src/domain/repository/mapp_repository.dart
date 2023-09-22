import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapp_config/src/domain/common/i_mapp_repository.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappRepository implements IMappRepository {
  IMappSqfliteStorage mappSqfliteStorage;

  MappRepository({required this.mappSqfliteStorage});

  @override
  Future<void> setupStorageFirstInstall(String deviceId, {Locale? locale}) async {
    final data = await mappSqfliteStorage.getDataOrNull();
    if (data != null) {
      await mappSqfliteStorage.updateByMap(data.copyWith(
        deviceId: deviceId,
        languageCode: locale?.languageCode,
        countryCode: locale?.countryCode,
      ));
    } else {
      await mappSqfliteStorage.removeDataAndInsert(MappEntity(
        deviceId: deviceId,
        languageCode: locale?.languageCode,
        countryCode: locale?.countryCode,
      ));
    }
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    await mappSqfliteStorage.updateLocale(languageCode: locale.languageCode, countryCode: locale.countryCode);
  }
}
