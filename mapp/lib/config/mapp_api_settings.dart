class MappApiDevSettings extends MappApiSettings {
  MappApiDevSettings()
      : super(
          baseUrl: 'https://api.bankmas.my.id/',
          baseGuestUrl: 'https://guest.bankmas.my.id/',
        );
}

class MappApiStagingSettings extends MappApiSettings {
  MappApiStagingSettings()
      : super(
          baseUrl: 'https://api.bankmas.link/',
          baseGuestUrl: 'https://guest.bankmas.link/',
        );
}

class MappApiSettings {
  String baseUrl;
  String baseGuestUrl;

  MappApiSettings({
    required this.baseUrl,
    required this.baseGuestUrl,
  });
}
