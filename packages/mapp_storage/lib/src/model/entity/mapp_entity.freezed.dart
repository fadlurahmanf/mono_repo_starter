// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MappEntity _$MappEntityFromJson(Map<String, dynamic> json) {
  return _MappEntity.fromJson(json);
}

/// @nodoc
mixin _$MappEntity {
  @JsonKey(name: 'cDeviceId')
  String get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cGuestToken')
  String? get guestToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'cCreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MappEntityCopyWith<MappEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MappEntityCopyWith<$Res> {
  factory $MappEntityCopyWith(
          MappEntity value, $Res Function(MappEntity) then) =
      _$MappEntityCopyWithImpl<$Res, MappEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cDeviceId') String deviceId,
      @JsonKey(name: 'cGuestToken') String? guestToken,
      @JsonKey(name: 'cCreatedAt') String? createdAt});
}

/// @nodoc
class _$MappEntityCopyWithImpl<$Res, $Val extends MappEntity>
    implements $MappEntityCopyWith<$Res> {
  _$MappEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? guestToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      guestToken: freezed == guestToken
          ? _value.guestToken
          : guestToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MappEntityCopyWith<$Res>
    implements $MappEntityCopyWith<$Res> {
  factory _$$_MappEntityCopyWith(
          _$_MappEntity value, $Res Function(_$_MappEntity) then) =
      __$$_MappEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cDeviceId') String deviceId,
      @JsonKey(name: 'cGuestToken') String? guestToken,
      @JsonKey(name: 'cCreatedAt') String? createdAt});
}

/// @nodoc
class __$$_MappEntityCopyWithImpl<$Res>
    extends _$MappEntityCopyWithImpl<$Res, _$_MappEntity>
    implements _$$_MappEntityCopyWith<$Res> {
  __$$_MappEntityCopyWithImpl(
      _$_MappEntity _value, $Res Function(_$_MappEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? guestToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MappEntity(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      guestToken: freezed == guestToken
          ? _value.guestToken
          : guestToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MappEntity implements _MappEntity {
  const _$_MappEntity(
      {@JsonKey(name: 'cDeviceId') required this.deviceId,
      @JsonKey(name: 'cGuestToken') this.guestToken,
      @JsonKey(name: 'cCreatedAt') this.createdAt});

  factory _$_MappEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MappEntityFromJson(json);

  @override
  @JsonKey(name: 'cDeviceId')
  final String deviceId;
  @override
  @JsonKey(name: 'cGuestToken')
  final String? guestToken;
  @override
  @JsonKey(name: 'cCreatedAt')
  final String? createdAt;

  @override
  String toString() {
    return 'MappEntity(deviceId: $deviceId, guestToken: $guestToken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MappEntity &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.guestToken, guestToken) ||
                other.guestToken == guestToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, guestToken, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MappEntityCopyWith<_$_MappEntity> get copyWith =>
      __$$_MappEntityCopyWithImpl<_$_MappEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MappEntityToJson(
      this,
    );
  }
}

abstract class _MappEntity implements MappEntity {
  const factory _MappEntity(
      {@JsonKey(name: 'cDeviceId') required final String deviceId,
      @JsonKey(name: 'cGuestToken') final String? guestToken,
      @JsonKey(name: 'cCreatedAt') final String? createdAt}) = _$_MappEntity;

  factory _MappEntity.fromJson(Map<String, dynamic> json) =
      _$_MappEntity.fromJson;

  @override
  @JsonKey(name: 'cDeviceId')
  String get deviceId;
  @override
  @JsonKey(name: 'cGuestToken')
  String? get guestToken;
  @override
  @JsonKey(name: 'cCreatedAt')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MappEntityCopyWith<_$_MappEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
