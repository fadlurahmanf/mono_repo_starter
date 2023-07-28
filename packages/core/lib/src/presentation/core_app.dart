import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => context.getIt.get<LocalizationBloc>()),
      ],
      child: const _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp({Key? key}) : super(key: key);

  @override
  State<_MaterialApp> createState() => _MaterialAppState();
}

class _MaterialAppState extends State<_MaterialApp> {
  LocalizationBloc? localizationBloc;

  @override
  void initState() {
    super.initState();
    if (context.getIt.get<AppSettings>().useAlice == true) {
      if (AppUtility.alice == null) {
        context.getIt.get<AppLogger>().wtf('USE ALICE TRUE BUT ALICE NULL');
      }

      AppUtility.addNavigatorKeyToAlice(Get.key);
    }

    localizationBloc = context.getIt.get<LocalizationBloc>();
    localizationBloc?.add(LocalizationEvent.initAppLanguage(defaultLocale: AppUtility.defaultLocale));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<LocalizationBloc, LocalizationState>(listener: (context, state) {
            if (state.currentLocale != null) {
              Get.updateLocale(state.currentLocale!);
            }
          })
        ],
        child: BlocBuilder<LocalizationBloc, LocalizationState>(builder: (context, locState) {
          final currentLocale = locState.currentLocale;
          return Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                title: context.getIt.get<AppSettings>().appName,
                navigatorKey: context.getIt.get<AppSettings>().useAlice == true && AppUtility.alice != null
                    ? AppUtility.alice?.getNavigatorKey()
                    : Get.key,
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
                locale: currentLocale,
                translationsKeys: AppUtility.translationMap,
                getPages: AppUtility.pages,
                initialRoute: AppUtility.pages.first.name,
                unknownRoute: AppUtility.unknownRoute,
              );
            },
          );
        }));
  }
}
