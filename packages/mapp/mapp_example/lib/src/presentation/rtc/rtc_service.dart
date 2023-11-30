import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

Map<String, dynamic> configuration = {
  'sdpSemantics': 'plan-b',
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

class RTCService {
  RTCService();


  Future<void> dispose() async {
  }
}
