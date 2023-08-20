part of 'video_call_bloc.dart';

@freezed
class VideoCallState with _$VideoCallState {
  const factory VideoCallState({
    String? localStreamId,
    List<String>? remoteStreamIds,
  }) = _VideoCallState;

  factory VideoCallState.initialize() => const VideoCallState();
}