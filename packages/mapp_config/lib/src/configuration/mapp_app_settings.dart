import 'package:core/core.dart';

class MappAppDevSettings extends MappAppSettings {
  MappAppDevSettings() : super(useLog: true, useAlice: true);
}

class MappAppStagingSettings extends MappAppSettings {
  MappAppStagingSettings() : super(useLog: true, useAlice: false);
}

class MappAppSettings extends AppSettings {
  MappAppSettings({required super.useLog, required super.useAlice}) : super(appName: 'MAPP');
}
