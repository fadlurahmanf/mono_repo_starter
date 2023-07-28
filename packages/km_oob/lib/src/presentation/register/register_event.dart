part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.fillFullName({
    required String fullName,
  }) = _FillFullName;
  const factory RegisterEvent.fillEmail({
    required String email,
  }) = _FillEmail;
  const factory RegisterEvent.fillPassword({
    required String password,
  }) = _FillPassword;
  const factory RegisterEvent.fillConfPassword({
    required String password,
  }) = _FillConfPassowrd;
}
