// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'km_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KmEntity _$KmEntityFromJson(Map<String, dynamic> json) {
  return _KmEntity.fromJson(json);
}

/// @nodoc
mixin _$KmEntity {
  @JsonKey(name: 'cDeviceId')
  String get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cCreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KmEntityCopyWith<KmEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KmEntityCopyWith<$Res> {
  factory $KmEntityCopyWith(KmEntity value, $Res Function(KmEntity) then) =
      _$KmEntityCopyWithImpl<$Res, KmEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cDeviceId') String deviceId,
      @JsonKey(name: 'cCreatedAt') String? createdAt});
}

/// @nodoc
class _$KmEntityCopyWithImpl<$Res, $Val extends KmEntity>
    implements $KmEntityCopyWith<$Res> {
  _$KmEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KmEntityCopyWith<$Res> implements $KmEntityCopyWith<$Res> {
  factory _$$_KmEntityCopyWith(
          _$_KmEntity value, $Res Function(_$_KmEntity) then) =
      __$$_KmEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cDeviceId') String deviceId,
      @JsonKey(name: 'cCreatedAt') String? createdAt});
}

/// @nodoc
class __$$_KmEntityCopyWithImpl<$Res>
    extends _$KmEntityCopyWithImpl<$Res, _$_KmEntity>
    implements _$$_KmEntityCopyWith<$Res> {
  __$$_KmEntityCopyWithImpl(
      _$_KmEntity _value, $Res Function(_$_KmEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_KmEntity(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KmEntity implements _KmEntity {
  const _$_KmEntity(
      {@JsonKey(name: 'cDeviceId') required this.deviceId,
      @JsonKey(name: 'cCreatedAt') this.createdAt});

  factory _$_KmEntity.fromJson(Map<String, dynamic> json) =>
      _$$_KmEntityFromJson(json);

  @override
  @JsonKey(name: 'cDeviceId')
  final String deviceId;
  @override
  @JsonKey(name: 'cCreatedAt')
  final String? createdAt;

  @override
  String toString() {
    return 'KmEntity(deviceId: $deviceId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KmEntity &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KmEntityCopyWith<_$_KmEntity> get copyWith =>
      __$$_KmEntityCopyWithImpl<_$_KmEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KmEntityToJson(
      this,
    );
  }
}

abstract class _KmEntity implements KmEntity {
  const factory _KmEntity(
      {@JsonKey(name: 'cDeviceId') required final String deviceId,
      @JsonKey(name: 'cCreatedAt') final String? createdAt}) = _$_KmEntity;

  factory _KmEntity.fromJson(Map<String, dynamic> json) = _$_KmEntity.fromJson;

  @override
  @JsonKey(name: 'cDeviceId')
  String get deviceId;
  @override
  @JsonKey(name: 'cCreatedAt')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_KmEntityCopyWith<_$_KmEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
