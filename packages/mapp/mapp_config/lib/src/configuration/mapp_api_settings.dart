import 'package:core_config/config.dart';

class MappApiSettings extends ApiSettings {
  MappApiSettings({
    required super.baseUrl,
  }) : super(
          connectTimeout: const Duration(seconds: 2),
          receiveTimeout: const Duration(seconds: 2),
          sendTimeout: const Duration(seconds: 2),
        );
}

class MappApiDevSettings extends MappApiSettings {
  MappApiDevSettings() : super(baseUrl: 'https://merchant.bankmas.my.id/');
}
