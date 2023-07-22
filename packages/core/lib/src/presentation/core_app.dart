import 'package:core/src/app_settings.dart';
import 'package:core/src/external/extension.dart';
import 'package:core/src/presentation/core_app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoreApp extends StatelessWidget {
  final CoreAppSettings coreAppSettings;

  const CoreApp({
    required this.coreAppSettings,
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: context.getIt.get<AppSettings>().appName,
      navigatorKey: Get.key,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: coreAppSettings.pages,
      initialRoute: coreAppSettings.pages.first.name,
      unknownRoute: coreAppSettings.unknownRoute,
    );
  }
}
