// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applink_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
    required TResult Function() remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
    TResult? Function()? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    TResult Function()? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
    required TResult Function(_Remove value) remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
    TResult? Function(_Remove value)? remove,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLinkEventCopyWith<$Res> {
  factory $AppLinkEventCopyWith(
          AppLinkEvent value, $Res Function(AppLinkEvent) then) =
      _$AppLinkEventCopyWithImpl<$Res, AppLinkEvent>;
}

/// @nodoc
class _$AppLinkEventCopyWithImpl<$Res, $Val extends AppLinkEvent>
    implements $AppLinkEventCopyWith<$Res> {
  _$AppLinkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$AppLinkEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'AppLinkEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
    required TResult Function() remove,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
    TResult? Function()? remove,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    TResult Function()? remove,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
    required TResult Function(_Remove value) remove,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
    TResult? Function(_Remove value)? remove,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements AppLinkEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_ListenCopyWith<$Res> {
  factory _$$_ListenCopyWith(_$_Listen value, $Res Function(_$_Listen) then) =
      __$$_ListenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ListenCopyWithImpl<$Res>
    extends _$AppLinkEventCopyWithImpl<$Res, _$_Listen>
    implements _$$_ListenCopyWith<$Res> {
  __$$_ListenCopyWithImpl(_$_Listen _value, $Res Function(_$_Listen) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Listen implements _Listen {
  const _$_Listen();

  @override
  String toString() {
    return 'AppLinkEvent.listen()';
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
    required TResult Function() init,
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
    required TResult Function() remove,
  }) {
    return listen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
    TResult? Function()? remove,
  }) {
    return listen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    TResult Function()? remove,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
    required TResult Function(_Remove value) remove,
  }) {
    return listen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
    TResult? Function(_Remove value)? remove,
  }) {
    return listen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (listen != null) {
      return listen(this);
    }
    return orElse();
  }
}

abstract class _Listen implements AppLinkEvent {
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
    extends _$AppLinkEventCopyWithImpl<$Res, _$_Process>
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
    return 'AppLinkEvent.process(uri: $uri)';
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
    required TResult Function() init,
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
    required TResult Function() remove,
  }) {
    return process(uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
    TResult? Function()? remove,
  }) {
    return process?.call(uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    TResult Function()? remove,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
    required TResult Function(_Remove value) remove,
  }) {
    return process(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
    TResult? Function(_Remove value)? remove,
  }) {
    return process?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (process != null) {
      return process(this);
    }
    return orElse();
  }
}

abstract class _Process implements AppLinkEvent {
  const factory _Process(final Uri uri) = _$_Process;

  Uri get uri;
  @JsonKey(ignore: true)
  _$$_ProcessCopyWith<_$_Process> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveCopyWith<$Res> {
  factory _$$_RemoveCopyWith(_$_Remove value, $Res Function(_$_Remove) then) =
      __$$_RemoveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RemoveCopyWithImpl<$Res>
    extends _$AppLinkEventCopyWithImpl<$Res, _$_Remove>
    implements _$$_RemoveCopyWith<$Res> {
  __$$_RemoveCopyWithImpl(_$_Remove _value, $Res Function(_$_Remove) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Remove implements _Remove {
  const _$_Remove();

  @override
  String toString() {
    return 'AppLinkEvent.remove()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Remove);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() listen,
    required TResult Function(Uri uri) process,
    required TResult Function() remove,
  }) {
    return remove();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? listen,
    TResult? Function(Uri uri)? process,
    TResult? Function()? remove,
  }) {
    return remove?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? listen,
    TResult Function(Uri uri)? process,
    TResult Function()? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Listen value) listen,
    required TResult Function(_Process value) process,
    required TResult Function(_Remove value) remove,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Listen value)? listen,
    TResult? Function(_Process value)? process,
    TResult? Function(_Remove value)? remove,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Listen value)? listen,
    TResult Function(_Process value)? process,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements AppLinkEvent {
  const factory _Remove() = _$_Remove;
}

/// @nodoc
mixin _$AppLinkState {
  Uri? get uri => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLinkStateCopyWith<AppLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLinkStateCopyWith<$Res> {
  factory $AppLinkStateCopyWith(
          AppLinkState value, $Res Function(AppLinkState) then) =
      _$AppLinkStateCopyWithImpl<$Res, AppLinkState>;
  @useResult
  $Res call({Uri? uri});
}

/// @nodoc
class _$AppLinkStateCopyWithImpl<$Res, $Val extends AppLinkState>
    implements $AppLinkStateCopyWith<$Res> {
  _$AppLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLinkStateCopyWith<$Res>
    implements $AppLinkStateCopyWith<$Res> {
  factory _$$_AppLinkStateCopyWith(
          _$_AppLinkState value, $Res Function(_$_AppLinkState) then) =
      __$$_AppLinkStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uri? uri});
}

/// @nodoc
class __$$_AppLinkStateCopyWithImpl<$Res>
    extends _$AppLinkStateCopyWithImpl<$Res, _$_AppLinkState>
    implements _$$_AppLinkStateCopyWith<$Res> {
  __$$_AppLinkStateCopyWithImpl(
      _$_AppLinkState _value, $Res Function(_$_AppLinkState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = freezed,
  }) {
    return _then(_$_AppLinkState(
      uri: freezed == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc

class _$_AppLinkState implements _AppLinkState {
  const _$_AppLinkState({this.uri});

  @override
  final Uri? uri;

  @override
  String toString() {
    return 'AppLinkState(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLinkState &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLinkStateCopyWith<_$_AppLinkState> get copyWith =>
      __$$_AppLinkStateCopyWithImpl<_$_AppLinkState>(this, _$identity);
}

abstract class _AppLinkState implements AppLinkState {
  const factory _AppLinkState({final Uri? uri}) = _$_AppLinkState;

  @override
  Uri? get uri;
  @override
  @JsonKey(ignore: true)
  _$$_AppLinkStateCopyWith<_$_AppLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}
