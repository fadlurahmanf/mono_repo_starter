part of 'mapp_bloc.dart';

@freezed
class MappState with _$MappState {
  const factory MappState({
    Locale? locale,
  }) = _MappState;

  factory MappState.initialize() => const MappState();
}