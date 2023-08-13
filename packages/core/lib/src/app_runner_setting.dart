import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final FirebaseModule? firebaseModule;
  final List<BaseModule> childModules;
  final List<RouteModule> routeModules;
  final Widget app;

  AppRunnerSetting({
    required this.c,
    this.firebaseModule,
    required this.childModules,
    required this.routeModules,
    required this.app,
  });
}
