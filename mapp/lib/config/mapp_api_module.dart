import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp/config/mapp_api_settings.dart';

class MappApiModule extends ApiModule {
  MappApiSettings settings;
  MappApiModule({required this.settings});

  @override
  Future<void> registerApiSetting(GetIt c) async {
    c.registerLazySingleton<MappApiSettings>(() => settings);
  }

  @override
  Future<void> registerBaseOption(GetIt c) async {

  }

  @override
  Future<void> registerDio(GetIt c) async {

  }
}
