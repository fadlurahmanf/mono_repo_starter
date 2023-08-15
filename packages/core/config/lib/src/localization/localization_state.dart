part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState({
    Locale? currentLocale,
  }) = _LocalizationState;

  factory LocalizationState.initialize() => const LocalizationState();
}
