part of 'applink_bloc.dart';

@freezed
class AppLinkState with _$AppLinkState {
  const factory AppLinkState({
    Uri? uri
  }) = _AppLinkState;

  factory AppLinkState.initialize() => const AppLinkState();
}
