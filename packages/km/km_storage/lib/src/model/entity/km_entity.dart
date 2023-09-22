import 'package:freezed_annotation/freezed_annotation.dart';

part 'km_entity.freezed.dart';

part 'km_entity.g.dart';

@freezed
class KmEntity with _$KmEntity {
  const factory KmEntity({
    @JsonKey(name: 'cDeviceId') required String deviceId,
    @JsonKey(name: 'cCreatedAt') String? createdAt,
  }) = _KmEntity;

  factory KmEntity.fromJson(Map<String, dynamic> json) => _$KmEntityFromJson(json);

  static const String table = 'mapp';
  static const String cDeviceId = 'cDeviceId';
  static const String cCreatedAt = 'cCreatedAt';
}
