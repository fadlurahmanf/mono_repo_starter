import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppLocalizationSettings extends Translations {
  List<Locale> get supportedLocales;
}
