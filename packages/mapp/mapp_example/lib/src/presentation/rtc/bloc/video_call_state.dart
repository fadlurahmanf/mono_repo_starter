part of 'video_call_bloc.dart';

@freezed
class VideoCallState with _$VideoCallState {
  const factory VideoCallState({
    InitializeConnectionState? initializeConnectionState,
  }) = _VideoCallState;

  factory VideoCallState.initialize() => const VideoCallState();
}

abstract class InitializeConnectionState {}

class InitializeConnectionIdle extends InitializeConnectionState {}

class InitializeConnectionLoading extends InitializeConnectionState {}

class InitializeConnectionSuccess extends InitializeConnectionState {
  ConnectionResponse connectionResponse;

  InitializeConnectionSuccess({required this.connectionResponse});
}

class InitializeConnectionFailed extends InitializeConnectionState {}
