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
    required PostingRegisterState postingRegisterState,
  }) = _RegisterState;

  factory RegisterState.initialize() => RegisterState(
    postingRegisterState: PostingRegisterIdle()
  );
}

abstract class PostingRegisterState {}

class PostingRegisterIdle extends PostingRegisterState {}

class PostingRegisterLoading extends PostingRegisterState {}

class PostingRegisterSuccess extends PostingRegisterState {}

class PostingRegisterFailed extends PostingRegisterState {}
