// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_applink_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoreAppLinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreAppLinkEventCopyWith<$Res> {
  factory $CoreAppLinkEventCopyWith(
          CoreAppLinkEvent value, $Res Function(CoreAppLinkEvent) then) =
      _$CoreAppLinkEventCopyWithImpl<$Res, CoreAppLinkEvent>;
}

/// @nodoc
class _$CoreAppLinkEventCopyWithImpl<$Res, $Val extends CoreAppLinkEvent>
    implements $CoreAppLinkEventCopyWith<$Res> {
  _$CoreAppLinkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ListenCopyWith<$Res> {
  factory _$$_ListenCopyWith(_$_Listen value, $Res Function(_$_Listen) then) =
      __$$_ListenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ListenCopyWithImpl<$Res>
    extends _$CoreAppLinkEventCopyWithImpl<$Res, _$_Listen>
    implements _$$_ListenCopyWith<$Res> {
  __$$_ListenCopyWithImpl(_$_Listen _value, $Res Function(_$_Listen) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Listen implements _Listen {
  const _$_Listen();

  @override
  String toString() {
    return 'CoreAppLinkEvent.listen()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Listen);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
  }) {
    return listen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
  }) {
    return listen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    required TResult orElse(),
  }) {
    if (listen != null) {
      return listen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
  }) {
    return listen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
  }) {
    return listen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    required TResult orElse(),
  }) {
    if (listen != null) {
      return listen(this);
    }
    return orElse();
  }
}

abstract class _Listen implements CoreAppLinkEvent {
  const factory _Listen() = _$_Listen;
}

/// @nodoc
abstract class _$$_ProcessCopyWith<$Res> {
  factory _$$_ProcessCopyWith(
          _$_Process value, $Res Function(_$_Process) then) =
      __$$_ProcessCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$_ProcessCopyWithImpl<$Res>
    extends _$CoreAppLinkEventCopyWithImpl<$Res, _$_Process>
    implements _$$_ProcessCopyWith<$Res> {
  __$$_ProcessCopyWithImpl(_$_Process _value, $Res Function(_$_Process) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$_Process(
      null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_Process implements _Process {
  const _$_Process(this.uri);

  @override
  final Uri uri;

  @override
  String toString() {
    return 'CoreAppLinkEvent.process(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Process &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessCopyWith<_$_Process> get copyWith =>
      __$$_ProcessCopyWithImpl<_$_Process>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
  }) {
    return process(uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
  }) {
    return process?.call(uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    required TResult orElse(),
  }) {
    if (process != null) {
      return process(uri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
  }) {
    return process(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
  }) {
    return process?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    required TResult orElse(),
  }) {
    if (process != null) {
      return process(this);
    }
    return orElse();
  }
}

abstract class _Process implements CoreAppLinkEvent {
  const factory _Process(final Uri uri) = _$_Process;

  Uri get uri;
  @JsonKey(ignore: true)
  _$$_ProcessCopyWith<_$_Process> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CoreAppLinkState {
  Uri? get uri => throw _privateConstructorUsedError;
  CoreException? get errorListener => throw _privateConstructorUsedError;
  CoreException? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoreAppLinkStateCopyWith<CoreAppLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreAppLinkStateCopyWith<$Res> {
  factory $CoreAppLinkStateCopyWith(
          CoreAppLinkState value, $Res Function(CoreAppLinkState) then) =
      _$CoreAppLinkStateCopyWithImpl<$Res, CoreAppLinkState>;
  @useResult
  $Res call({Uri? uri, CoreException? errorListener, CoreException? error});
}

/// @nodoc
class _$CoreAppLinkStateCopyWithImpl<$Res, $Val extends CoreAppLinkState>
    implements $CoreAppLinkStateCopyWith<$Res> {
  _$CoreAppLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = freezed,
    Object? errorListener = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri?,
      errorListener: freezed == errorListener
          ? _value.errorListener
          : errorListener // ignore: cast_nullable_to_non_nullable
              as CoreException?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CoreException?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoreAppLinkStateCopyWith<$Res>
    implements $CoreAppLinkStateCopyWith<$Res> {
  factory _$$_CoreAppLinkStateCopyWith(
          _$_CoreAppLinkState value, $Res Function(_$_CoreAppLinkState) then) =
      __$$_CoreAppLinkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri? uri, CoreException? errorListener, CoreException? error});
}

/// @nodoc
class __$$_CoreAppLinkStateCopyWithImpl<$Res>
    extends _$CoreAppLinkStateCopyWithImpl<$Res, _$_CoreAppLinkState>
    implements _$$_CoreAppLinkStateCopyWith<$Res> {
  __$$_CoreAppLinkStateCopyWithImpl(
      _$_CoreAppLinkState _value, $Res Function(_$_CoreAppLinkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = freezed,
    Object? errorListener = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_CoreAppLinkState(
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri?,
      errorListener: freezed == errorListener
          ? _value.errorListener
          : errorListener // ignore: cast_nullable_to_non_nullable
              as CoreException?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CoreException?,
    ));
  }
}

/// @nodoc

class _$_CoreAppLinkState implements _CoreAppLinkState {
  const _$_CoreAppLinkState({this.uri, this.errorListener, this.error});

  @override
  final Uri? uri;
  @override
  final CoreException? errorListener;
  @override
  final CoreException? error;

  @override
  String toString() {
    return 'CoreAppLinkState(uri: $uri, errorListener: $errorListener, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoreAppLinkState &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.errorListener, errorListener) ||
                other.errorListener == errorListener) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri, errorListener, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoreAppLinkStateCopyWith<_$_CoreAppLinkState> get copyWith =>
      __$$_CoreAppLinkStateCopyWithImpl<_$_CoreAppLinkState>(this, _$identity);
}

abstract class _CoreAppLinkState implements CoreAppLinkState {
  const factory _CoreAppLinkState(
      {final Uri? uri,
      final CoreException? errorListener,
      final CoreException? error}) = _$_CoreAppLinkState;

  @override
  Uri? get uri;
  @override
  CoreException? get errorListener;
  @override
  CoreException? get error;
  @override
  @JsonKey(ignore: true)
  _$$_CoreAppLinkStateCopyWith<_$_CoreAppLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}
