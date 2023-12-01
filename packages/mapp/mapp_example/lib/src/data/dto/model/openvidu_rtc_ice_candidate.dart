import 'package:flutter_webrtc/flutter_webrtc.dart';

class OpenviduRTCIceCandidate extends RTCIceCandidate {
  final String candidate;
  final String sdpMid;
  final int sdpMLineIndex;
  final String? endpointName;

  OpenviduRTCIceCandidate({
    required this.candidate,
    required this.sdpMid,
    required this.sdpMLineIndex,
    this.endpointName,
  }) : super(candidate, sdpMid, sdpMLineIndex);

  @override
  toMap() {
    return {'candidate': candidate, 'sdpMid': sdpMid, 'sdpMLineIndex': sdpMLineIndex, 'endpointName': endpointName};
  }
}
