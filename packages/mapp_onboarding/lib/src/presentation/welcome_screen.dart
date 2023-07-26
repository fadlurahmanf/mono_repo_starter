import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:mapp_onboarding/src/presentation/tnc_screen.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WelcomeLayout(
      key: key,
    );
  }
}

class _WelcomeLayout extends StatefulWidget {
  const _WelcomeLayout({Key? key}) : super(key: key);

  @override
  State<_WelcomeLayout> createState() => _WelcomeLayoutState();
}

class _WelcomeLayoutState extends State<_WelcomeLayout> {
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
                context.getIt.get<LocalizationBloc>().add(LocalizationEvent.setLanguage(locale: Locale('id', 'ID')));
              },
              child: Text('GANTI KE INDONESIA'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.getIt.get<LocalizationBloc>().add(LocalizationEvent.setLanguage(locale: Locale('en', 'ID')));
              },
              child: Text('GANTI KE ENGLISH'),
            ),
            ElevatedButton(
              onPressed: () async {
                context.push(TNCScreen, transition: Transition.fadeIn);
              },
              child: Text("data"),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.getIt.get<MappSqfliteRepository>().insert(
                        mappEntity: MappEntity(
                      deviceId: 'DEVICE_ID',
                    ));
              },
              child: Text("INSERT"),
            ),
            ElevatedButton(
              onPressed: () async {
                final list = await context.getIt.get<MappSqfliteRepository>().getAll();
                list.forEach((element) {
                  print("masuk element: ${element.toJson()}");
                });
              },
              child: Text("GET"),
            ),
          ],
        ),
      ),
    );
  }
}
