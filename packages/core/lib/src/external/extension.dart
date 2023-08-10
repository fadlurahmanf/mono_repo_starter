import 'package:core/src/external/app_factory.dart';
import 'package:core/src/route/app_get_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

extension BuildContentX on BuildContext {
  GetIt get getIt {
    return AppFactory.I.getIt;
  }

  T getArgument<T>() {
    return Get.arguments;
  }

  Future<T?>? push<T>(Type module, Type screen, {Transition? transition}) {
    if (transition != null) {
      return Get.toNamed('/${module}_${screen}_${transition.hashCode}', arguments: {'TES': 'TES'});
    } else {
      return Get.toNamed('/${module}_$screen', arguments: {'TES': 'TES'});
    }
  }

  Future<T?> showBottomsheet<T>(Widget bottomsheet, {bool isDismissible = true, bool enableDrag = true}) {
    return Get.bottomSheet(bottomsheet, isDismissible: isDismissible, enableDrag: enableDrag);
  }

  void dismissBottomsheet() {
    return Get.until((route) => Get.isBottomSheetOpen == null || Get.isBottomSheetOpen == false);
  }
}
