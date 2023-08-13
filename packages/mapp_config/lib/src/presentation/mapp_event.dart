part of 'mapp_bloc.dart';

@freezed
class MappEvent with _$MappEvent {
  const factory MappEvent.saveDeviceId(String deviceId) = _SaveDeviceId;
  const factory MappEvent.saveLocale({required Locale locale}) = _SaveLocale;
}