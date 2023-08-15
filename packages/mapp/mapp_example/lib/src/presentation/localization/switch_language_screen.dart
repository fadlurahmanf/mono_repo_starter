import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchLanguageScreen extends StatefulWidget with WrapperState {
  const SwitchLanguageScreen({super.key});

  @override
  State<SwitchLanguageScreen> createState() => _SwitchLanguageScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _SwitchLanguageScreenState extends State<SwitchLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello_world'.tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      context
                          .provide<LocalizationBloc>()
                          .add(const LocalizationEvent.setLanguage(locale: Locale('id', 'ID')));
                    },
                    child: const Text('INDONESIA')),
                ElevatedButton(
                    onPressed: () async {
                      context
                          .provide<LocalizationBloc>()
                          .add(const LocalizationEvent.setLanguage(locale: Locale('en', 'ID')));
                    },
                    child: const Text('ENGLISH')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
