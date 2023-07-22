import 'package:core/src/localization/localization_bloc.dart';
import 'package:get_it/get_it.dart';

import '../module/app_module.dart';

class AppLocalizationModule extends BaseModule {
  @override
  void registerDependency(GetIt c) {
    c.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
  }
}
