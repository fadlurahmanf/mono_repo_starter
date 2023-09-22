import 'dart:js';

import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_fake/src/presentation/fake1_screen.dart';
import 'package:mapp_fake/src/presentation/splash_fake_screen.dart';

class MappFakeModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {}
}

class MappFakeRoutes extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(moduleType: MappFakeRoutes, screenType: SplashFakeScreen, page: (context) => SplashFakeScreen()),
        AppGetPage(moduleType: MappFakeRoutes, screenType: Fake1Screen, page: (context) => Fake1Screen()),
      ];
}
