import 'package:freezed_annotation/freezed_annotation.dart';

part 'mapp_entity.freezed.dart';

part 'mapp_entity.g.dart';

@freezed
class MappEntity with _$MappEntity {
  const factory MappEntity({
    @JsonKey(name: 'cDeviceId') required String deviceId,
    @JsonKey(name: 'cGuestToken') String? guestToken,
    @JsonKey(name: 'cLanguageCode') String? languageCode,
    @JsonKey(name: 'cCountryCode') String? countryCode,
    @JsonKey(name: 'cCreatedAt') String? createdAt,
  }) = _MappEntity;

  factory MappEntity.fromJson(Map<String, dynamic> json) => _$MappEntityFromJson(json);

  static const String table = 'mapp';
  static const String cDeviceId = 'cDeviceId';
  static const String cGuestToken = 'cGuestToken';
  static const String cLanguageCode = 'cLanguageCode';
  static const String cCountryCode = 'cCountryCode';
  static const String cCreatedAt = 'cCreatedAt';
}
