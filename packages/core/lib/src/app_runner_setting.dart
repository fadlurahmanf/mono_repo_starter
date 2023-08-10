import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final AppModuleSettings appModuleSettings;
  final Widget app;

  AppRunnerSetting({
    required this.c,
    required this.appModuleSettings,
    required this.app,
  });
}
