import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:mapp_config/mapp_config.dart';

class NotificationScreen extends StatefulWidget with WrapperState {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final per = await context.get<IMappNotificationRepository>().requestPermission();
                print('MASUK PERMISSION: $per');
              },
              child: Text('NOTIF 1 ACTION'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.get<IMappNotificationRepository>().showNotification(1, title: 'TITLE 1', body: 'BODY 1');
              },
              child: Text('NOTIF 1 ACTION'),
            ),
          ],
        ),
      ),
    );
  }
}
