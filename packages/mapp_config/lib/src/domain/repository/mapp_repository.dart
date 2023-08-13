import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapp_config/src/domain/common/i_mapp_repository.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappRepository implements IMappRepository {
  IMappSqfliteStorage mappSqfliteStorage;

  MappRepository({required this.mappSqfliteStorage});

  @override
  Future<Locale?> getLocale() async {
    final data = await mappSqfliteStorage.getDataOrNull();
    if (data != null && data.languageCode != null && data.countryCode != null) {
      return Locale(data.languageCode!, data.countryCode);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveOrUpdateDeviceId(String deviceId) async {
    final data = await mappSqfliteStorage.getDataOrNull();
    if (data != null) {
      await mappSqfliteStorage.updateDeviceId(deviceId);
    } else {
      await mappSqfliteStorage.removeDataAndInsert(MappEntity(deviceId: deviceId));
    }
  }
}
