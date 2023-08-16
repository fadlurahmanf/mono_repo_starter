import 'package:core_config/config.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  context.pushNamed('MappExampleRoute', 'SwitchLanguageScreen');
                },
                child: Text('SWITCH LANGUAGE'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pushNamed('MappExampleRoute', 'NotificationScreen');
              },
              child: Text('NOTIFICATION'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pushNamed('MappExampleRoute', 'StorageScreen');
              },
              child: Text('STORAGE'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pushNamed('MappExampleRoute', 'LocatorScreen');
              },
              child: Text('LOCATOR'),
            ),
          ],
        ),
      ),
    );
  }
}
