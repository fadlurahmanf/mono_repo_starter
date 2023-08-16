import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:core_locator/locator.dart';

class LocatorScreen extends StatefulWidget with WrapperState {
  const LocatorScreen({super.key});

  @override
  State<LocatorScreen> createState() => _LocatorScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _LocatorScreenState extends State<LocatorScreen> {
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
                final per = await context.get<ILocatorRepository>().requestPermission();
                print("MASUK PER: ${per.name}");
              },
              child: Text('GET CURRENT PERMISSION'),
            ),
            ElevatedButton(
              onPressed: () async {
                final loc = await context.get<ILocatorRepository>().getCurrentPosition();
                print("MASUK latitude: ${loc.latitude}, longitude: ${loc.longitude}");
              },
              child: Text('GET CURRENT POSITION'),
            ),
          ],
        ),
      ),
    );
  }
}
