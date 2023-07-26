import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_entity.freezed.dart';

part 'core_entity.g.dart';

@freezed
class CoreEntity with _$CoreEntity {
  const factory CoreEntity({
    @JsonKey(name: 'cLanguageCode') required String languageCode,
  }) = _CoreEntity;

  factory CoreEntity.fromJson(Map<String, dynamic> json) => _$CoreEntityFromJson(json);

  static const String table = 'core';
  static const String cLanguageCode = 'cLanguageCode';
}
