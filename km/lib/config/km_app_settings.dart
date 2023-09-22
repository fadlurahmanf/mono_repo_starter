import 'package:core/config.dart';

class KmAppDevSettings extends KmAppSettings {
  KmAppDevSettings() : super(useLog: true, useAlice: true);
}

class KmAppStagingSettings extends KmAppSettings {
  KmAppStagingSettings() : super(useLog: true, useAlice: false);
}

class KmAppSettings extends AppSettings {
  KmAppSettings({required super.useLog, required super.useAlice}) : super(appName: 'MAPP');
}
