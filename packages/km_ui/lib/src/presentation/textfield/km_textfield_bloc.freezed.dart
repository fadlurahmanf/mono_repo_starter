// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'km_textfield_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KmTextFieldEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) typing,
    required TResult Function(String? error) setError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? typing,
    TResult? Function(String? error)? setError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? typing,
    TResult Function(String? error)? setError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Typing value) typing,
    required TResult Function(_SetError value) setError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Typing value)? typing,
    TResult? Function(_SetError value)? setError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Typing value)? typing,
    TResult Function(_SetError value)? setError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KmTextFieldEventCopyWith<$Res> {
  factory $KmTextFieldEventCopyWith(
          KmTextFieldEvent value, $Res Function(KmTextFieldEvent) then) =
      _$KmTextFieldEventCopyWithImpl<$Res, KmTextFieldEvent>;
}

/// @nodoc
class _$KmTextFieldEventCopyWithImpl<$Res, $Val extends KmTextFieldEvent>
    implements $KmTextFieldEventCopyWith<$Res> {
  _$KmTextFieldEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TypingCopyWith<$Res> {
  factory _$$_TypingCopyWith(_$_Typing value, $Res Function(_$_Typing) then) =
      __$$_TypingCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_TypingCopyWithImpl<$Res>
    extends _$KmTextFieldEventCopyWithImpl<$Res, _$_Typing>
    implements _$$_TypingCopyWith<$Res> {
  __$$_TypingCopyWithImpl(_$_Typing _value, $Res Function(_$_Typing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_Typing(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Typing implements _Typing {
  const _$_Typing({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'KmTextFieldEvent.typing(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Typing &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypingCopyWith<_$_Typing> get copyWith =>
      __$$_TypingCopyWithImpl<_$_Typing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) typing,
    required TResult Function(String? error) setError,
  }) {
    return typing(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? typing,
    TResult? Function(String? error)? setError,
  }) {
    return typing?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? typing,
    TResult Function(String? error)? setError,
    required TResult orElse(),
  }) {
    if (typing != null) {
      return typing(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Typing value) typing,
    required TResult Function(_SetError value) setError,
  }) {
    return typing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Typing value)? typing,
    TResult? Function(_SetError value)? setError,
  }) {
    return typing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Typing value)? typing,
    TResult Function(_SetError value)? setError,
    required TResult orElse(),
  }) {
    if (typing != null) {
      return typing(this);
    }
    return orElse();
  }
}

abstract class _Typing implements KmTextFieldEvent {
  const factory _Typing({required final String text}) = _$_Typing;

  String get text;
  @JsonKey(ignore: true)
  _$$_TypingCopyWith<_$_Typing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetErrorCopyWith<$Res> {
  factory _$$_SetErrorCopyWith(
          _$_SetError value, $Res Function(_$_SetError) then) =
      __$$_SetErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_SetErrorCopyWithImpl<$Res>
    extends _$KmTextFieldEventCopyWithImpl<$Res, _$_SetError>
    implements _$$_SetErrorCopyWith<$Res> {
  __$$_SetErrorCopyWithImpl(
      _$_SetError _value, $Res Function(_$_SetError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_SetError(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SetError implements _SetError {
  const _$_SetError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'KmTextFieldEvent.setError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetErrorCopyWith<_$_SetError> get copyWith =>
      __$$_SetErrorCopyWithImpl<_$_SetError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) typing,
    required TResult Function(String? error) setError,
  }) {
    return setError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? typing,
    TResult? Function(String? error)? setError,
  }) {
    return setError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? typing,
    TResult Function(String? error)? setError,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Typing value) typing,
    required TResult Function(_SetError value) setError,
  }) {
    return setError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Typing value)? typing,
    TResult? Function(_SetError value)? setError,
  }) {
    return setError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Typing value)? typing,
    TResult Function(_SetError value)? setError,
    required TResult orElse(),
  }) {
    if (setError != null) {
      return setError(this);
    }
    return orElse();
  }
}

abstract class _SetError implements KmTextFieldEvent {
  const factory _SetError({final String? error}) = _$_SetError;

  String? get error;
  @JsonKey(ignore: true)
  _$$_SetErrorCopyWith<_$_SetError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KmTextFieldState {
  String? get text => throw _privateConstructorUsedError;
  bool? get showLabel => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KmTextFieldStateCopyWith<KmTextFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KmTextFieldStateCopyWith<$Res> {
  factory $KmTextFieldStateCopyWith(
          KmTextFieldState value, $Res Function(KmTextFieldState) then) =
      _$KmTextFieldStateCopyWithImpl<$Res, KmTextFieldState>;
  @useResult
  $Res call({String? text, bool? showLabel, String? error});
}

/// @nodoc
class _$KmTextFieldStateCopyWithImpl<$Res, $Val extends KmTextFieldState>
    implements $KmTextFieldStateCopyWith<$Res> {
  _$KmTextFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? showLabel = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      showLabel: freezed == showLabel
          ? _value.showLabel
          : showLabel // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KmTextFieldStateCopyWith<$Res>
    implements $KmTextFieldStateCopyWith<$Res> {
  factory _$$_KmTextFieldStateCopyWith(
          _$_KmTextFieldState value, $Res Function(_$_KmTextFieldState) then) =
      __$$_KmTextFieldStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, bool? showLabel, String? error});
}

/// @nodoc
class __$$_KmTextFieldStateCopyWithImpl<$Res>
    extends _$KmTextFieldStateCopyWithImpl<$Res, _$_KmTextFieldState>
    implements _$$_KmTextFieldStateCopyWith<$Res> {
  __$$_KmTextFieldStateCopyWithImpl(
      _$_KmTextFieldState _value, $Res Function(_$_KmTextFieldState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? showLabel = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_KmTextFieldState(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      showLabel: freezed == showLabel
          ? _value.showLabel
          : showLabel // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_KmTextFieldState implements _KmTextFieldState {
  const _$_KmTextFieldState({this.text, this.showLabel, this.error});

  @override
  final String? text;
  @override
  final bool? showLabel;
  @override
  final String? error;

  @override
  String toString() {
    return 'KmTextFieldState(text: $text, showLabel: $showLabel, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KmTextFieldState &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.showLabel, showLabel) ||
                other.showLabel == showLabel) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, showLabel, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KmTextFieldStateCopyWith<_$_KmTextFieldState> get copyWith =>
      __$$_KmTextFieldStateCopyWithImpl<_$_KmTextFieldState>(this, _$identity);
}

abstract class _KmTextFieldState implements KmTextFieldState {
  const factory _KmTextFieldState(
      {final String? text,
      final bool? showLabel,
      final String? error}) = _$_KmTextFieldState;

  @override
  String? get text;
  @override
  bool? get showLabel;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_KmTextFieldStateCopyWith<_$_KmTextFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}
