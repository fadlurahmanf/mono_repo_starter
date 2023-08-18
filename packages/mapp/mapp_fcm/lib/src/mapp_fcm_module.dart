import 'dart:math';

import 'package:core_fcm/fcm.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_config/mapp_config.dart';

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  final title = message.data['title'];
  final body = message.data['body'];
  final type = message.data['type'];
  if (title != null && title is String && body != null && body is String) {
    // c.get<IMappNotificationRepository>().showNotification(
    //   Random().nextInt(1000),
    //   title: title,
    //   body: body,
    // );
  }
}

class MappFCMModule extends FCMModule {

  @override
  Future<void> registerListener() async {
    // FirebaseMe
  }
}
