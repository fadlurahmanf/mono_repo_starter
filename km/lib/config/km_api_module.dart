import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:km/config/km_api_settings.dart';

class KmApiModule extends ApiModule {
  KmApiSettings settings;

  KmApiModule({required this.settings});

  @override
  Future<void> registerApiSetting(GetIt c) async {
    c.registerLazySingleton<KmApiSettings>(() => settings);
  }

  @override
  Future<void> registerBaseOption(GetIt c) async {}

  @override
  Future<void> registerDio(GetIt c) async {}
}
