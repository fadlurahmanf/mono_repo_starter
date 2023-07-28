// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullName) fillFullName,
    required TResult Function(String email) fillEmail,
    required TResult Function(String password) fillPassword,
    required TResult Function(String password) fillConfPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullName)? fillFullName,
    TResult? Function(String email)? fillEmail,
    TResult? Function(String password)? fillPassword,
    TResult? Function(String password)? fillConfPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullName)? fillFullName,
    TResult Function(String email)? fillEmail,
    TResult Function(String password)? fillPassword,
    TResult Function(String password)? fillConfPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FillFullName value) fillFullName,
    required TResult Function(_FillEmail value) fillEmail,
    required TResult Function(_FillPassword value) fillPassword,
    required TResult Function(_FillConfPassowrd value) fillConfPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FillFullName value)? fillFullName,
    TResult? Function(_FillEmail value)? fillEmail,
    TResult? Function(_FillPassword value)? fillPassword,
    TResult? Function(_FillConfPassowrd value)? fillConfPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FillFullName value)? fillFullName,
    TResult Function(_FillEmail value)? fillEmail,
    TResult Function(_FillPassword value)? fillPassword,
    TResult Function(_FillConfPassowrd value)? fillConfPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FillFullNameCopyWith<$Res> {
  factory _$$_FillFullNameCopyWith(
          _$_FillFullName value, $Res Function(_$_FillFullName) then) =
      __$$_FillFullNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String fullName});
}

/// @nodoc
class __$$_FillFullNameCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_FillFullName>
    implements _$$_FillFullNameCopyWith<$Res> {
  __$$_FillFullNameCopyWithImpl(
      _$_FillFullName _value, $Res Function(_$_FillFullName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
  }) {
    return _then(_$_FillFullName(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FillFullName implements _FillFullName {
  const _$_FillFullName({required this.fullName});

  @override
  final String fullName;

  @override
  String toString() {
    return 'RegisterEvent.fillFullName(fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FillFullName &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FillFullNameCopyWith<_$_FillFullName> get copyWith =>
      __$$_FillFullNameCopyWithImpl<_$_FillFullName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullName) fillFullName,
    required TResult Function(String email) fillEmail,
    required TResult Function(String password) fillPassword,
    required TResult Function(String password) fillConfPassword,
  }) {
    return fillFullName(fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullName)? fillFullName,
    TResult? Function(String email)? fillEmail,
    TResult? Function(String password)? fillPassword,
    TResult? Function(String password)? fillConfPassword,
  }) {
    return fillFullName?.call(fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullName)? fillFullName,
    TResult Function(String email)? fillEmail,
    TResult Function(String password)? fillPassword,
    TResult Function(String password)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillFullName != null) {
      return fillFullName(fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FillFullName value) fillFullName,
    required TResult Function(_FillEmail value) fillEmail,
    required TResult Function(_FillPassword value) fillPassword,
    required TResult Function(_FillConfPassowrd value) fillConfPassword,
  }) {
    return fillFullName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FillFullName value)? fillFullName,
    TResult? Function(_FillEmail value)? fillEmail,
    TResult? Function(_FillPassword value)? fillPassword,
    TResult? Function(_FillConfPassowrd value)? fillConfPassword,
  }) {
    return fillFullName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FillFullName value)? fillFullName,
    TResult Function(_FillEmail value)? fillEmail,
    TResult Function(_FillPassword value)? fillPassword,
    TResult Function(_FillConfPassowrd value)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillFullName != null) {
      return fillFullName(this);
    }
    return orElse();
  }
}

abstract class _FillFullName implements RegisterEvent {
  const factory _FillFullName({required final String fullName}) =
      _$_FillFullName;

  String get fullName;
  @JsonKey(ignore: true)
  _$$_FillFullNameCopyWith<_$_FillFullName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FillEmailCopyWith<$Res> {
  factory _$$_FillEmailCopyWith(
          _$_FillEmail value, $Res Function(_$_FillEmail) then) =
      __$$_FillEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_FillEmailCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_FillEmail>
    implements _$$_FillEmailCopyWith<$Res> {
  __$$_FillEmailCopyWithImpl(
      _$_FillEmail _value, $Res Function(_$_FillEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_FillEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FillEmail implements _FillEmail {
  const _$_FillEmail({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterEvent.fillEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FillEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FillEmailCopyWith<_$_FillEmail> get copyWith =>
      __$$_FillEmailCopyWithImpl<_$_FillEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullName) fillFullName,
    required TResult Function(String email) fillEmail,
    required TResult Function(String password) fillPassword,
    required TResult Function(String password) fillConfPassword,
  }) {
    return fillEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullName)? fillFullName,
    TResult? Function(String email)? fillEmail,
    TResult? Function(String password)? fillPassword,
    TResult? Function(String password)? fillConfPassword,
  }) {
    return fillEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullName)? fillFullName,
    TResult Function(String email)? fillEmail,
    TResult Function(String password)? fillPassword,
    TResult Function(String password)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillEmail != null) {
      return fillEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FillFullName value) fillFullName,
    required TResult Function(_FillEmail value) fillEmail,
    required TResult Function(_FillPassword value) fillPassword,
    required TResult Function(_FillConfPassowrd value) fillConfPassword,
  }) {
    return fillEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FillFullName value)? fillFullName,
    TResult? Function(_FillEmail value)? fillEmail,
    TResult? Function(_FillPassword value)? fillPassword,
    TResult? Function(_FillConfPassowrd value)? fillConfPassword,
  }) {
    return fillEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FillFullName value)? fillFullName,
    TResult Function(_FillEmail value)? fillEmail,
    TResult Function(_FillPassword value)? fillPassword,
    TResult Function(_FillConfPassowrd value)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillEmail != null) {
      return fillEmail(this);
    }
    return orElse();
  }
}

abstract class _FillEmail implements RegisterEvent {
  const factory _FillEmail({required final String email}) = _$_FillEmail;

  String get email;
  @JsonKey(ignore: true)
  _$$_FillEmailCopyWith<_$_FillEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FillPasswordCopyWith<$Res> {
  factory _$$_FillPasswordCopyWith(
          _$_FillPassword value, $Res Function(_$_FillPassword) then) =
      __$$_FillPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_FillPasswordCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_FillPassword>
    implements _$$_FillPasswordCopyWith<$Res> {
  __$$_FillPasswordCopyWithImpl(
      _$_FillPassword _value, $Res Function(_$_FillPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_FillPassword(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FillPassword implements _FillPassword {
  const _$_FillPassword({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.fillPassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FillPassword &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FillPasswordCopyWith<_$_FillPassword> get copyWith =>
      __$$_FillPasswordCopyWithImpl<_$_FillPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullName) fillFullName,
    required TResult Function(String email) fillEmail,
    required TResult Function(String password) fillPassword,
    required TResult Function(String password) fillConfPassword,
  }) {
    return fillPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullName)? fillFullName,
    TResult? Function(String email)? fillEmail,
    TResult? Function(String password)? fillPassword,
    TResult? Function(String password)? fillConfPassword,
  }) {
    return fillPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullName)? fillFullName,
    TResult Function(String email)? fillEmail,
    TResult Function(String password)? fillPassword,
    TResult Function(String password)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillPassword != null) {
      return fillPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FillFullName value) fillFullName,
    required TResult Function(_FillEmail value) fillEmail,
    required TResult Function(_FillPassword value) fillPassword,
    required TResult Function(_FillConfPassowrd value) fillConfPassword,
  }) {
    return fillPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FillFullName value)? fillFullName,
    TResult? Function(_FillEmail value)? fillEmail,
    TResult? Function(_FillPassword value)? fillPassword,
    TResult? Function(_FillConfPassowrd value)? fillConfPassword,
  }) {
    return fillPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FillFullName value)? fillFullName,
    TResult Function(_FillEmail value)? fillEmail,
    TResult Function(_FillPassword value)? fillPassword,
    TResult Function(_FillConfPassowrd value)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillPassword != null) {
      return fillPassword(this);
    }
    return orElse();
  }
}

abstract class _FillPassword implements RegisterEvent {
  const factory _FillPassword({required final String password}) =
      _$_FillPassword;

  String get password;
  @JsonKey(ignore: true)
  _$$_FillPasswordCopyWith<_$_FillPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FillConfPassowrdCopyWith<$Res> {
  factory _$$_FillConfPassowrdCopyWith(
          _$_FillConfPassowrd value, $Res Function(_$_FillConfPassowrd) then) =
      __$$_FillConfPassowrdCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_FillConfPassowrdCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_FillConfPassowrd>
    implements _$$_FillConfPassowrdCopyWith<$Res> {
  __$$_FillConfPassowrdCopyWithImpl(
      _$_FillConfPassowrd _value, $Res Function(_$_FillConfPassowrd) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_FillConfPassowrd(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FillConfPassowrd implements _FillConfPassowrd {
  const _$_FillConfPassowrd({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.fillConfPassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FillConfPassowrd &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FillConfPassowrdCopyWith<_$_FillConfPassowrd> get copyWith =>
      __$$_FillConfPassowrdCopyWithImpl<_$_FillConfPassowrd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullName) fillFullName,
    required TResult Function(String email) fillEmail,
    required TResult Function(String password) fillPassword,
    required TResult Function(String password) fillConfPassword,
  }) {
    return fillConfPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullName)? fillFullName,
    TResult? Function(String email)? fillEmail,
    TResult? Function(String password)? fillPassword,
    TResult? Function(String password)? fillConfPassword,
  }) {
    return fillConfPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullName)? fillFullName,
    TResult Function(String email)? fillEmail,
    TResult Function(String password)? fillPassword,
    TResult Function(String password)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillConfPassword != null) {
      return fillConfPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FillFullName value) fillFullName,
    required TResult Function(_FillEmail value) fillEmail,
    required TResult Function(_FillPassword value) fillPassword,
    required TResult Function(_FillConfPassowrd value) fillConfPassword,
  }) {
    return fillConfPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FillFullName value)? fillFullName,
    TResult? Function(_FillEmail value)? fillEmail,
    TResult? Function(_FillPassword value)? fillPassword,
    TResult? Function(_FillConfPassowrd value)? fillConfPassword,
  }) {
    return fillConfPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FillFullName value)? fillFullName,
    TResult Function(_FillEmail value)? fillEmail,
    TResult Function(_FillPassword value)? fillPassword,
    TResult Function(_FillConfPassowrd value)? fillConfPassword,
    required TResult orElse(),
  }) {
    if (fillConfPassword != null) {
      return fillConfPassword(this);
    }
    return orElse();
  }
}

abstract class _FillConfPassowrd implements RegisterEvent {
  const factory _FillConfPassowrd({required final String password}) =
      _$_FillConfPassowrd;

  String get password;
  @JsonKey(ignore: true)
  _$$_FillConfPassowrdCopyWith<_$_FillConfPassowrd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confPassword => throw _privateConstructorUsedError;
  String? get eFullName => throw _privateConstructorUsedError;
  String? get eEmail => throw _privateConstructorUsedError;
  String? get ePassword => throw _privateConstructorUsedError;
  String? get eConfPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {String? fullName,
      String? email,
      String? password,
      String? confPassword,
      String? eFullName,
      String? eEmail,
      String? ePassword,
      String? eConfPassword});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confPassword = freezed,
    Object? eFullName = freezed,
    Object? eEmail = freezed,
    Object? ePassword = freezed,
    Object? eConfPassword = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confPassword: freezed == confPassword
          ? _value.confPassword
          : confPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      eFullName: freezed == eFullName
          ? _value.eFullName
          : eFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      eEmail: freezed == eEmail
          ? _value.eEmail
          : eEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ePassword: freezed == ePassword
          ? _value.ePassword
          : ePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      eConfPassword: freezed == eConfPassword
          ? _value.eConfPassword
          : eConfPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fullName,
      String? email,
      String? password,
      String? confPassword,
      String? eFullName,
      String? eEmail,
      String? ePassword,
      String? eConfPassword});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confPassword = freezed,
    Object? eFullName = freezed,
    Object? eEmail = freezed,
    Object? ePassword = freezed,
    Object? eConfPassword = freezed,
  }) {
    return _then(_$_RegisterState(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confPassword: freezed == confPassword
          ? _value.confPassword
          : confPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      eFullName: freezed == eFullName
          ? _value.eFullName
          : eFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      eEmail: freezed == eEmail
          ? _value.eEmail
          : eEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      ePassword: freezed == ePassword
          ? _value.ePassword
          : ePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      eConfPassword: freezed == eConfPassword
          ? _value.eConfPassword
          : eConfPassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {this.fullName,
      this.email,
      this.password,
      this.confPassword,
      this.eFullName,
      this.eEmail,
      this.ePassword,
      this.eConfPassword});

  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confPassword;
  @override
  final String? eFullName;
  @override
  final String? eEmail;
  @override
  final String? ePassword;
  @override
  final String? eConfPassword;

  @override
  String toString() {
    return 'RegisterState(fullName: $fullName, email: $email, password: $password, confPassword: $confPassword, eFullName: $eFullName, eEmail: $eEmail, ePassword: $ePassword, eConfPassword: $eConfPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confPassword, confPassword) ||
                other.confPassword == confPassword) &&
            (identical(other.eFullName, eFullName) ||
                other.eFullName == eFullName) &&
            (identical(other.eEmail, eEmail) || other.eEmail == eEmail) &&
            (identical(other.ePassword, ePassword) ||
                other.ePassword == ePassword) &&
            (identical(other.eConfPassword, eConfPassword) ||
                other.eConfPassword == eConfPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, email, password,
      confPassword, eFullName, eEmail, ePassword, eConfPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {final String? fullName,
      final String? email,
      final String? password,
      final String? confPassword,
      final String? eFullName,
      final String? eEmail,
      final String? ePassword,
      final String? eConfPassword}) = _$_RegisterState;

  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confPassword;
  @override
  String? get eFullName;
  @override
  String? get eEmail;
  @override
  String? get ePassword;
  @override
  String? get eConfPassword;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
