class AppSettings {
  final String appName;
  final bool useLog;
  final bool useAlice;

  AppSettings({
    required this.appName,
    required this.useLog,
    required this.useAlice,
  });
}

class ApiSettings {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration sendTimeout;
  final Duration receiveTimeout;

  ApiSettings({
    required this.baseUrl,
    required this.connectTimeout,
    required this.sendTimeout,
    required this.receiveTimeout,
  });
}
