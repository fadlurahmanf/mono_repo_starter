part of 'km_textfield_bloc.dart';

@freezed
class KmTextFieldState with _$KmTextFieldState {
  const factory KmTextFieldState({
    String? text,
    bool? showLabel,
    String? error,
  }) = _KmTextFieldState;

  factory KmTextFieldState.initialize() => const KmTextFieldState();
}
