import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MappCoreAppSettings extends CoreAppSettings {
  MappCoreAppSettings()
      : super(
          pages: [],
          translationKeys: {},
          unknownRoute: GetPage(
            name: '/unknown',
            page: () => const SizedBox.expand(),
          ),
        );
}
