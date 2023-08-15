// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io';

import 'package:core/src/data/repositories/notification/i_notification_repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationRepository implements INotificationRepository {
  final _plugins = FlutterLocalNotificationsPlugin();

  String get GENERAL_CHANNEL_ID;

  String get GENERAL_CHANNEL_NAME;

  AndroidNotificationDetails get androidNotificationDetails => AndroidNotificationDetails(
    GENERAL_CHANNEL_ID,
    GENERAL_CHANNEL_NAME,
  );

  DarwinNotificationDetails get darwinNotificationDetails => const DarwinNotificationDetails();

  NotificationDetails get notificationDetails => NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
  );

  @override
  Future<bool?> requestPermission() {
    if (Platform.isAndroid) {
      final platform = _plugins.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (platform != null) {
        return platform.requestPermission();
      } else {
        return Future.value(null);
      }
    } else if (Platform.isIOS) {
      final platform = _plugins.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      if (platform != null) {
        return platform.requestPermissions(alert: true, badge: true, sound: true);
      } else {
        return Future.value(null);
      }
    } else {
      throw UnimplementedError();
    }
  }

  AndroidInitializationSettings get androidInitializationSettings;

  DarwinInitializationSettings get darwinInitializationSettings;

  @override
  Future<bool?> init() async {
    return _plugins.initialize(InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    ));
  }

  @override
  Future<void> showNotification(
      int id, {
        required String title,
        required String body,
        NotificationDetails? notificationDetails,
      }) {
    return _plugins.show(id, title, body, notificationDetails ?? this.notificationDetails);
  }
}
