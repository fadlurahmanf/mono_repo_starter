part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState({required ChangeLanguageState changeLanguageState}) = _LocalizationState;
  factory LocalizationState.initialize() => LocalizationState(changeLanguageState: ChangeLanguageIdle());
}

abstract class ChangeLanguageState {}

class ChangeLanguageIdle extends ChangeLanguageState {}

class ChangeLanguageLoading extends ChangeLanguageState {}

class ChangeLanguageSuccess extends ChangeLanguageState {}

class ChangeLanguageFailed extends ChangeLanguageState {}
