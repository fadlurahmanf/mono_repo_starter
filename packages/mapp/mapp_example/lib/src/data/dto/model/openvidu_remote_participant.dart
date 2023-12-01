import 'package:flutter_webrtc/flutter_webrtc.dart';

class OpenviduRemoteParticipant {
  final String id;
  final String? streamId;
  final bool? isVideoActive;
  final bool? isAudioActive;
  MediaStream? stream;
  RTCPeerConnection? peerConnection;

  OpenviduRemoteParticipant({
    required this.id,
    this.streamId,
    this.isVideoActive,
    this.isAudioActive,
    this.stream,
    this.peerConnection,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'streamId': streamId, 'isVideoActive': isVideoActive, 'isAudioActive': isAudioActive};
}
