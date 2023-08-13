import 'dart:async';

import 'package:flutter/material.dart';

abstract class IMappRepository {
  Future<Locale?> getLocale();
  Future<void> saveOrUpdateDeviceId(String deviceId);
}