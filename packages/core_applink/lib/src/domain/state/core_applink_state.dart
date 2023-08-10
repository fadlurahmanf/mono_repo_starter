part of 'core_applink_bloc.dart';

@freezed
class CoreAppLinkState with _$CoreAppLinkState {
  const factory CoreAppLinkState({
    Uri? uri,
    CoreException? errorListener,
    CoreException? error,
  }) = _CoreAppLinkState;

  factory CoreAppLinkState.initialize() => const CoreAppLinkState();
}
