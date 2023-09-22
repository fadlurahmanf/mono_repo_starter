import 'dart:async';

import 'package:flutter/material.dart';

abstract class IMappRepository {
  Future<void> setupStorageFirstInstall(String deviceId, {Locale? locale});
  Future<void> saveLocale(Locale locale);
}
