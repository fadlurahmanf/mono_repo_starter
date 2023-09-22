part of 'mapp_bloc.dart';

@freezed
class MappEvent with _$MappEvent {
  const factory MappEvent.init(String deviceId, {Locale? locale}) = _Init;
  const factory MappEvent.saveLocale(Locale locale) = _SaveLocale;
}