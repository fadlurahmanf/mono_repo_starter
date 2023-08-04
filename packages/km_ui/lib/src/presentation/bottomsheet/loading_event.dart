part of 'loading_bloc.dart';

@freezed
class LoadingEvent with _$LoadingEvent {
  const factory LoadingEvent.setTimer(Timer timer) = _SetTimer;
  const factory LoadingEvent.setLoadingInAWhile() = _SetLoadingInAWhile;
}