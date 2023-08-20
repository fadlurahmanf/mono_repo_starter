import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';

class RTCService {
  Function(MediaStream) onLocalStream;

  RTCService({required this.onLocalStream});

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

  RTCPeerConnection? _peerConnection;

  Future<void> initLocalUserMedia() async {
    final mediaConstraints = {
      'audio': true,
      'video': {
        'facingMode': 'user',
      }
    };
    final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    onLocalStream(stream);
  }

  Future<void> createOffer() async {
    // final description = await _peerConnection?.createOffer({
    //   'offerToReceiveVideo': 1,
    // });
    // var session = parse(description.sdp.toString());
    // print(json.encode(session));
    // _offer = true;
    //
    // if (description == null) {
    //   return;
    // }
    // _peerConnection?.setLocalDescription(description);
  }
}
