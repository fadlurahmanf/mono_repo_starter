part of 'applink_bloc.dart';

@freezed
class AppLinkEvent with _$AppLinkEvent {
  const factory AppLinkEvent.init() = _Init;
  const factory AppLinkEvent.listen() = _Listen;
  const factory AppLinkEvent.process(Uri uri) = _Process;
  const factory AppLinkEvent.remove() = _Remove;
}
