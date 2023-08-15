import 'package:core/core.dart';
import 'package:core_fcm/src/data/repositories/_index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

abstract class FCMModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    FirebaseMessaging.onBackgroundMessage((message) => onBackgroundMessage(message, c));
    c.registerLazySingleton<IFCMRepository>(() => FCMRepository());
  }

  @pragma('vm:entry-point')
  Future<void> onBackgroundMessage(RemoteMessage message, GetIt c);
}
