import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MappApp extends StatelessWidget {
  const MappApp({super.key});

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
  LocalizationBloc? _localizationBloc;

  @override
  void initState() {
    super.initState();
    _localizationBloc = context.getIt.get<LocalizationBloc>();
    if (AppFactory.I.defaultLocale != null) {
      _localizationBloc?.add(LocalizationEvent.setLanguage(locale: AppFactory.I.defaultLocale!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<LocalizationBloc, LocalizationState>(
              listenWhen: (previous, current) =>
                  previous.currentLocale?.languageCode != current.currentLocale?.languageCode,
              listener: (context, state) {
                if (state.currentLocale != null) {
                  Get.updateLocale(state.currentLocale!);
                  // TODO(DEVELOPER): save storage language code
                }
              })
        ],
        child: BlocBuilder<LocalizationBloc, LocalizationState>(builder: (context, locState) {
          final currentLocale = locState.currentLocale;
          return Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                title: 'Mapp',
                navigatorKey: AppFactory.I.alice?.getNavigatorKey() ?? AppFactory.I.navigatorKey,
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
                getPages: AppFactory.I.onGenerateRoute(context),
                translationsKeys: AppFactory.I.translationMap,
                initialRoute: AppFactory.I.routes.first.fullPath,
                unknownRoute: AppFactory.I.unknownRoute,
              );
            },
          );
        }));
  }
}
