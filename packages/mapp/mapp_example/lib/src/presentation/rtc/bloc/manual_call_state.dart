part of 'manual_call_bloc.dart';

@freezed
class ManualCallState with _$ManualCallState {
  const factory ManualCallState({
    String? roomId,
    String? platformCaller,
    MediaStream? localStream,
    MediaStream? remoteStream,
    RTCPeerConnection? peerConnection,

    String? info,

    bool? successDispose,
  }) = _ManualCallState;

  factory ManualCallState.initialize() => const ManualCallState();
}