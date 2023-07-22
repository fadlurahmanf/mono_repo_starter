import 'package:core/core.dart';

class MappAppDevSettings extends MappAppSettings {
  MappAppDevSettings() : super(useAlice: true);
}

class MappAppStagingSettings extends MappAppSettings {
  MappAppStagingSettings() : super(useAlice: false);
}

class MappAppSettings extends AppSettings {
  bool useAlice;

  MappAppSettings({required this.useAlice}) : super(appName: 'MAPP');
}
