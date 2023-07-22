import 'package:flutter/material.dart';

class AppGetPage {
  Type moduleType;
  Type screenType;
  Widget Function() page;

  AppGetPage({
    required this.moduleType,
    required this.screenType,
    required this.page,
  });
}