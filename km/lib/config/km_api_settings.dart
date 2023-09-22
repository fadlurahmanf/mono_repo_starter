class KmApiDevSettings extends KmApiSettings {
  KmApiDevSettings()
      : super(
          baseOcrUrl: 'https://api.bankmas.my.id/',
        );
}

class KmApiStagingSettings extends KmApiSettings {
  KmApiStagingSettings()
      : super(
          baseOcrUrl: 'https://api.bankmas.link/',
        );
}

class KmApiSettings {
  String baseOcrUrl;

  KmApiSettings({
    required this.baseOcrUrl,
  });
}
