import 'package:core/src/external/app_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

extension BuildContentX on BuildContext {
  GetIt get getIt {
    return AppFactory.I.getIt;
  }

  T provide<T extends StateStreamableSource<Object?>>() {
    return BlocProvider.of<T>(this);
  }

  T get<T extends Object>({String? instanceName, dynamic param1, dynamic param2, Type? type}) {
    return getIt.get<T>(instanceName: instanceName, param1: param1, param2: param2, type: type);
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

  String _getFullPathNamed(String module, String screen, {Transition? transition}) {
    final route = AppFactory.I.routes
            .firstWhereOrNull((element) =>
                element.fullPath.contains('/${module}_${screen}_${transition.hashCode}') ||
                element.fullPath.contains('/${module}_$screen'))
            ?.fullPath ??
        '/unknown';
    return route;
  }

  Future<T?>? pushNamed<T>(String module, String screen, {Transition? transition}) {
    final route = _getFullPathNamed(module, screen, transition: transition);
    return Get.toNamed(route);
  }

  Future<T?>? pushReplaceAll<T>(Type module, Type screen, {Transition? transition}) {
    if (transition != null) {
      return Get.offAllNamed('/${module}_${screen}_${transition.hashCode}', arguments: {'TES': 'TES'});
    } else {
      return Get.offAllNamed('/${module}_$screen', arguments: {'TES': 'TES'});
    }
  }

  void back<T>({T? result}) {
    return Get.back(result: result);
  }

  Future<T?> showBottomsheet<T>(Widget bottomsheet, {bool isDismissible = true, bool enableDrag = true}) {
    return Get.bottomSheet(bottomsheet, isDismissible: isDismissible, enableDrag: enableDrag);
  }

  void dismissBottomsheet() {
    return Get.until((route) => Get.isBottomSheetOpen == null || Get.isBottomSheetOpen == false);
  }
}
