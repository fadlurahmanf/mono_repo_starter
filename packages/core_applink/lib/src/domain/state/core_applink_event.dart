part of 'core_applink_bloc.dart';

@freezed
class CoreAppLinkEvent with _$CoreAppLinkEvent {
  const factory CoreAppLinkEvent.listen() = _Listen;

  const factory CoreAppLinkEvent.process(Uri uri) = _Process;
}
