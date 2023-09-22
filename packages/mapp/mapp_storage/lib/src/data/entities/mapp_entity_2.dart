import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:floor_annotation/floor_annotation.dart';

part 'mapp_entity_2.g.dart';

@entity
@JsonSerializable(explicitToJson: true)
class MappEntity2 {
  static const String cDeviceId = 'cDeviceId';
  static const String cGuestToken = 'cGuestToken';
  static const String cLanguageCode = 'cLanguageCode';
  static const String cCountryCode = 'cCountryCode';
  static const String cCreatedAt = 'cCreatedAt';

  @PrimaryKey()
  @JsonKey(name: cDeviceId)
  final String deviceId;
  @JsonKey(name: cGuestToken)
  String? guestToken;
  @JsonKey(name: cLanguageCode)
  String? languageCode;
  @JsonKey(name: cCountryCode)
  String? countryCode;
  @JsonKey(name: cCreatedAt)
  String? createdAt;

  MappEntity2({
    required this.deviceId,
    this.guestToken,
    this.languageCode,
    this.countryCode,
    this.createdAt,
  });

  factory MappEntity2.fromJson(Map<String, dynamic> json) => _$MappEntity2FromJson(json);

  Map<String, dynamic> toJson() => _$MappEntity2ToJson(this);
}
