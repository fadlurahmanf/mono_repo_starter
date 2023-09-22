import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppRunnerSetting {
  final GetIt c;
  final List<BaseModule> childModules;
  final List<RouteModule> routeModules;
  final Widget app;

  AppRunnerSetting({
    required this.c,
    required this.childModules,
    required this.routeModules,
    required this.app,
  });
}
