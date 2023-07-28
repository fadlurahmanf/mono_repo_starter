part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    String? fullName,
    String? email,
    String? password,
    String? confPassword,
    String? eFullName,
    String? eEmail,
    String? ePassword,
    String? eConfPassword,
  }) = _RegisterState;

  factory RegisterState.initialize() => const RegisterState();
}
