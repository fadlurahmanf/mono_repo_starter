import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

class RTCService {
  void Function(MediaStream) onLocalStream;
  void Function(MediaStream) onRemoteStream;
  void Function(Map<String, dynamic>) onLocalOffer;

  RTCService({
    required this.onLocalStream,
    required this.onRemoteStream,
    required this.onLocalOffer,
  });

  Map<String, dynamic> configuration = {
    "iceServers": [
      {"url": "stun:stun.l.google.com:19302"},
    ]
  };

  final Map<String, dynamic> offerSdpConstraints = {
    "mandatory": {
      "OfferToReceiveAudio": true,
      "OfferToReceiveVideo": true,
    },
    "optional": [],
  };

  MediaStream? _localStream;

  Future<MediaStream> getLocalStream() async {
    final mediaConstraints = {
      'audio': true,
      'video': {
        'facingMode': 'user',
      }
    };
    final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localStream = stream;
    onLocalStream(stream);
    return stream;
  }

  RTCPeerConnection? _localPeerConnection;

  Future<RTCPeerConnection> initLocalPeerConnection() async {
    final peerConnection = await createPeerConnection(configuration, offerSdpConstraints);
    final localStream = await getLocalStream();
    localStream.getTracks().forEach((element) {
      peerConnection.addTrack(element, localStream);
    });
    peerConnection.onIceCandidate = (value) {
      if (value.candidate != null) {
        final js =
            json.encode({'candidate': value.candidate, 'sdpMid': value.sdpMid, 'sdpMlineIndex': value.sdpMLineIndex});
        print('onIceCandidate: $js');
      }
    };

    peerConnection.onIceConnectionState = (value) {
      print('onIceConnectionState: $value');
    };

    peerConnection.onAddStream = (stream) {
      onRemoteStream(stream);
    };
    _localPeerConnection = peerConnection;
    return peerConnection;
  }

  Future<void> createOffer() async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final sessionDescription = await _localPeerConnection!.createOffer({
      'offerToReceiveVideo': 1,
    });
    final offer = parse((sessionDescription.sdp ?? {}).toString());
    print('OFFER: $offer');
    onLocalOffer(offer);
    await _localPeerConnection!.setLocalDescription(sessionDescription);
  }

  Future<void> createAnswer() async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final sessionDescription = await _localPeerConnection!.createAnswer({
      'offerToReceiveVideo': 1,
    });
    await _localPeerConnection!.setLocalDescription(sessionDescription);
  }

  Future<void> setRemoteDescription(Map<String, dynamic> value) async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    String sdp = write(value, null);
    final description = RTCSessionDescription(sdp, 'answer');
    await _localPeerConnection!.setRemoteDescription(description);
  }

  Future<void> addCandidate(Map<String, dynamic> value) async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final candidate = RTCIceCandidate(value['candidate'], value['sdpMid'], value['sdpMlineIndex']);
    await _localPeerConnection!.addCandidate(candidate);
  }

  Future<void> init() async {
    await (initLocalPeerConnection().then((value) async {
      await createOffer();
    }));
  }

  Timer? _timer;

  void startPingPongTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {});
  }

  Future<void> dispose() async {
    unawaited(_localStream?.dispose());
    unawaited(_localPeerConnection?.dispose());
  }
}
