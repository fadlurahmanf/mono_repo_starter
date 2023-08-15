import 'package:core_config/config.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatefulWidget with WrapperState {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _UnknownScreenState extends State<UnknownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Unknown Screen'),
            ElevatedButton(
                onPressed: () async {
                  context.back();
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
