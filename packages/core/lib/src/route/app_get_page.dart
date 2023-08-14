import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGetPage {
  Type moduleType;
  Type screenType;
  Transition? transition;
  Widget Function(BuildContext context) page;
  bool firstRoute;

  String get fullPath {
    if (firstRoute && transition == null) {
      return '/';
    } else {
      if (transition != null) {
        return '/${moduleType}_${screenType}_$transition';
      } else {
        return '/${moduleType}_$screenType';
      }
    }
  }

  AppGetPage({
    required this.moduleType,
    required this.screenType,
    required this.page,
    this.transition,
    this.firstRoute = false,
  });

  AppGetPage copyWith({Transition? transition}) {
    return AppGetPage(
      moduleType: moduleType,
      screenType: screenType,
      page: page,
      transition: transition ?? this.transition,
    );
  }
}
