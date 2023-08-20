import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

class RTCService {
  void Function(MediaStream) onLocalStream;
  void Function(MediaStream) onRemoteStream;
  void Function(Map<String, dynamic>, String) onLocalOffer;
  void Function(Map<String, dynamic>, String) onRemoteAnswer;

  void Function() onLocalPeerConnectionReady;

  void Function(Map<String, dynamic>, String) onIceCandidate;

  RTCService({
    required this.onLocalStream,
    required this.onRemoteStream,
    required this.onLocalOffer,
    required this.onRemoteAnswer,
    required this.onLocalPeerConnectionReady,
    required this.onIceCandidate,
  });

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
        onIceCandidate(value.toMap() as Map<String, dynamic>, json.encode(value.toMap()));
      }
    };

    peerConnection.onIceGatheringState = (state) {
      print('LISTEN onIceGatheringState: $state');
    };

    peerConnection.onIceConnectionState = (value) {
      print('LISTE onIceConnectionState: $value');
    };

    peerConnection.onSignalingState = (value) {
      print('LISTEN onSignalingState: $value');
    };

    peerConnection.onAddStream = (stream) {
      stream.getTracks().forEach((element) {
        peerConnection.addTrack(element, stream);
      });
      remoteStream = stream;
      onRemoteStream(stream);
    };

    peerConnection.onTrack = (event) {
      event.streams.first.getTracks().forEach((element) {});
    };

    _localPeerConnection = peerConnection;
    onLocalPeerConnectionReady();
    return peerConnection;
  }

  MediaStream? remoteStream;

  Future<void> createLocalOffer() async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final sessionDescription = await _localPeerConnection!.createOffer({
      'offerToReceiveVideo': 1,
    });
    await _localPeerConnection!.setLocalDescription(sessionDescription);
    onLocalOffer(sessionDescription.toMap(), json.encode(sessionDescription.toMap()));
  }

  Future<void> createAnswer() async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final answer = await _localPeerConnection!.createAnswer();
    await _localPeerConnection!.setLocalDescription(answer);
    onRemoteAnswer(answer.toMap(), json.encode(answer.toMap()));
  }

  Future<void> setRemoteDescription(Map<String, dynamic> value) async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    final description = RTCSessionDescription(value['sdp'], value['type']);
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

  // Future<void> init() async {
  //   await (initLocalPeerConnection().then((value) async {
  //     await createLocalOffer();
  //   }));
  // }

  Timer? _timer;

  void startPingPongTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {});
  }

  Future<void> dispose() async {
    unawaited(_localStream?.dispose());
    unawaited(_localPeerConnection?.dispose());
  }
}
