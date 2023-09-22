part of 'localization_bloc.dart';

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.setLanguage({required Locale locale}) = _SetLanguage;
}
