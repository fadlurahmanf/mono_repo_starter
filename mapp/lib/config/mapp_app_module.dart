import 'package:core/core.dart';
import 'package:mapp/config/mapp_app_settings.dart';

class MappAppModule extends AppModule {
  MappAppSettings settings;

  MappAppModule({required this.settings})
      : super(
          appSettings: settings,
        );
}
