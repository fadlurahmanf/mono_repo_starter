import 'package:freezed_annotation/freezed_annotation.dart';

part 'mapp_entity.freezed.dart';

part 'mapp_entity.g.dart';

@freezed
class MappEntity with _$MappEntity {
  const factory MappEntity({
    @JsonKey(name: 'cDeviceId')
    required String deviceId,
  }) = _MappEntity;

  factory MappEntity.fromJson(Map<String, dynamic> json) => _$MappEntityFromJson(json);

  static const String table = 'mapp';
  static const String cDeviceId = 'cDeviceId';
}
