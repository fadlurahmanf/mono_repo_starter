// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MappEntity _$$_MappEntityFromJson(Map<String, dynamic> json) =>
    _$_MappEntity(
      deviceId: json['cDeviceId'] as String,
      guestToken: json['cGuestToken'] as String?,
      createdAt: json['cCreatedAt'] as String?,
    );

Map<String, dynamic> _$$_MappEntityToJson(_$_MappEntity instance) =>
    <String, dynamic>{
      'cDeviceId': instance.deviceId,
      'cGuestToken': instance.guestToken,
      'cCreatedAt': instance.createdAt,
    };
