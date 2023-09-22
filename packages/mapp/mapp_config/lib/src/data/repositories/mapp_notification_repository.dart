// ignore_for_file: non_constant_identifier_names

import 'package:core_config/config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'i_mapp_notification_repository.dart';

class MappNotificationRepository extends NotificationRepository implements IMappNotificationRepository {
  @override
  AndroidNotificationDetails get androidNotificationDetails => const AndroidNotificationDetails(
        'MAPP_CHANNEL_ID',
        'Mapp General',
      );

  @override
  NotificationDetails get notificationDetails =>
      NotificationDetails(android: androidNotificationDetails, iOS: super.darwinNotificationDetails);

  @override
  String get GENERAL_CHANNEL_ID => 'GENERAL';

  @override
  String get GENERAL_CHANNEL_NAME => 'Umum';

  @override
  AndroidInitializationSettings get androidInitializationSettings => const AndroidInitializationSettings('ic_launcher');

  @override
  DarwinInitializationSettings get darwinInitializationSettings => const DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        requestProvisionalPermission: true,
      );
}
