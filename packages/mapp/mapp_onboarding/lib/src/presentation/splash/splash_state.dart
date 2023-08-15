part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    GenerateGuestTokenState? generateGuestTokenState,
  }) = _SplashState;

  factory SplashState.initialize() => const SplashState();
}

abstract class GenerateGuestTokenState {}

class GenerateGuestTokenIdle extends GenerateGuestTokenState {}

class GenerateGuestTokenLoading extends GenerateGuestTokenState {}

class GenerateGuestTokenSuccess extends GenerateGuestTokenState {}

class GenerateGuestTokenFailed extends GenerateGuestTokenState {
  MappException exception;

  GenerateGuestTokenFailed({required this.exception});
}
