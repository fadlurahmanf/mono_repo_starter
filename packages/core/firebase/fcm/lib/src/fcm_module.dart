import 'package:core_config/config.dart';
import 'package:core_fcm/src/data/repositories/_index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

abstract class FCMModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<IFCMRepository>(() => FCMRepository());
    await registerListener();
  }

  Future<void> registerListener();
}
