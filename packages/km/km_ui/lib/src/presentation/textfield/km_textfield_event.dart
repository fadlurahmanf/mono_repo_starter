part of 'km_textfield_bloc.dart';

@freezed
class KmTextFieldEvent with _$KmTextFieldEvent {
  const factory KmTextFieldEvent.typing({
    required String text,
  }) = _Typing;

  const factory KmTextFieldEvent.setError({
    String? error,
  }) = _SetError;
}
