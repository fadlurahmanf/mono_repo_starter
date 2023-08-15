import 'dart:math';

import 'package:core_fcm/fcm.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_config/mapp_config.dart';

class MappFCMModule extends FCMModule {
  @override
  Future<void> onBackgroundMessage(RemoteMessage message, GetIt c) async {
    final title = message.data['title'];
    final body = message.data['body'];
    final type = message.data['type'];
    if (title != null && title is String && body != null && body is String) {
      c.get<IMappNotificationRepository>().showNotification(
            Random().nextInt(1000),
            title: title,
            body: body,
          );
    }
  }
}
