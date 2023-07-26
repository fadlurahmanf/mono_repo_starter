import 'package:core/src/external/app_utility.dart';
import 'package:core/src/route/app_get_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

extension BuildContentX on BuildContext {
  GetIt get getIt {
    return AppUtility.getIt;
  }

  T getArgument<T>() {
    return Get.arguments;
  }

  Future<T?>? push<T>(Type screen, {Transition? transition}) {
    if (transition != null) {
      return Get.toNamed('/${screen}_${transition.hashCode}', arguments: {'TES': 'TES'});
    } else {
      return Get.toNamed('/$screen', arguments: {'TES': 'TES'});
    }
  }
}

extension AppGetPageX on AppGetPage {
  List<GetPage<dynamic>> toGetPages() {
    final pages = <GetPage<dynamic>>[
      GetPage(name: '/$screenType', page: page),
    ];
    final transitions = <Transition>[
      Transition.fade,
      Transition.fadeIn,
      Transition.rightToLeft,
      Transition.leftToRight,
      Transition.upToDown,
      Transition.downToUp,
      Transition.rightToLeftWithFade,
      Transition.leftToRightWithFade,
      Transition.zoom,
      Transition.topLevel,
      Transition.noTransition,
      Transition.cupertino,
      Transition.cupertinoDialog,
      Transition.size,
      Transition.circularReveal,
      Transition.native,
    ];
    for (var transition in transitions) {
      pages.add(GetPage(name: '/${screenType}_${transition.hashCode}', page: page, transition: transition));
    }
    return pages;
  }
}
