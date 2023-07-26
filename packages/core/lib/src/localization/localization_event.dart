part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.changeLanguage() = _ChangeLanguage;

  const factory LocalizationEvent.initAppLanguage({
    Locale? defaultLocale,
  }) = _InitAppLanguage;
}
