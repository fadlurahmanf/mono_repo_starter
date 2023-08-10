import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:mapp_onboarding/src/mapp_onboarding_module.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';

class WelcomeScreen extends StatefulWidget with WrapperState {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(MappConstant.helloWorld.tr),
            ElevatedButton(
              onPressed: () async {
                context.getIt.get<LocalizationBloc>().add(const LocalizationEvent.setLanguage(locale: Locale('id', 'ID')));
              },
              child: const Text('GANTI KE INDONESIA'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.getIt.get<LocalizationBloc>().add(const LocalizationEvent.setLanguage(locale: Locale('en', 'ID')));
              },
              child: const Text('GANTI KE ENGLISH'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.push(MappOnBoardingRoutes, TNCScreen, transition: Transition.leftToRight);
              },
              child: const Text("PUSH TO TNC"),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.getIt.get<MappSqfliteRepository>().insert(
                    mappEntity: const MappEntity(
                      deviceId: 'DEVICE_ID',
                    ));
              },
              child: const Text("INSERT"),
            ),
            ElevatedButton(
              onPressed: () async {
                final list = await context.getIt.get<MappSqfliteRepository>().getAll();
                for (var element in list) {
                  print("masuk element: ${element.toJson()}");
                }
              },
              child: const Text("GET"),
            ),
          ],
        ),
      ),
    );
  }
}
