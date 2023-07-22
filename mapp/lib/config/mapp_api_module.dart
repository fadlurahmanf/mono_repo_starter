import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_api_settings.dart';

class MappApiModule extends ApiModule {
  MappApiSettings settings;
  MappApiModule({required this.settings});

  @override
  void registerApiSetting(GetIt c) {
    c.registerLazySingleton<MappApiSettings>(() => settings);
  }

  @override
  void registerBaseOption(GetIt c) {

  }

  @override
  void registerDio(GetIt c) {

  }
}
