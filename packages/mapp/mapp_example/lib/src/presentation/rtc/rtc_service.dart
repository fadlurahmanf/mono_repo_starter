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
      'video': true,
    };
    final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localStream = stream;
    onLocalStream(stream);
    return stream;
  }

  late RTCPeerConnection _localPeerConnection;

  Future<RTCPeerConnection> initLocalPeerConnection() async {
    _localPeerConnection = await createPeerConnection(configuration, offerSdpConstraints);
    final localStream = await getLocalStream();
    localStream.getTracks().forEach((element) {
      _localPeerConnection.addTrack(element, localStream);
    });
    _localPeerConnection.onIceCandidate = (value) {
      if (value.candidate != null) {
        onIceCandidate(value.toMap() as Map<String, dynamic>, json.encode(value.toMap()));
      }
    };

    _localPeerConnection.onIceGatheringState = (state) {
      print('LISTEN onIceGatheringState: $state');
    };

    _localPeerConnection.onIceConnectionState = (value) {
      print('LISTE onIceConnectionState: $value');
    };

    _localPeerConnection.onSignalingState = (value) {
      print('LISTEN onSignalingState: $value');
    };

    _localPeerConnection.onAddStream = (stream) {
      // print("MASUK ON ADD STREAM: ${stream.id}");
      // stream.getTracks().forEach((element) {
      //   _localPeerConnection.addTrack(element, stream);
      // });
      remoteStream = stream;
      onRemoteStream(stream);
    };

    _localPeerConnection.onTrack = (event) {
      event.streams.first.getTracks().forEach((element) {
        remoteStream?.addTrack(element);
      });
    };

    print("MASUK ON LOCAL PEER CONNECTION READY");
    onLocalPeerConnectionReady();
    return _localPeerConnection;
  }

  MediaStream? remoteStream;

  Future<void> createLocalOffer() async {
    final offer = await _localPeerConnection.createOffer({
      'offerToReceiveVideo': 1,
    });
    await _localPeerConnection.setLocalDescription(offer);
    onLocalOffer(offer.toMap(), json.encode(offer.toMap()));
  }

  Future<void> createAnswer() async {
    final answer = await _localPeerConnection.createAnswer({
      'offerToReceiveVideo': 1,
    });
    await _localPeerConnection.setLocalDescription(answer);
    onRemoteAnswer(answer.toMap(), json.encode(answer.toMap()));
  }

  Future<void> setRemoteDescription(Map<String, dynamic> value) async {
    final description = RTCSessionDescription(value['sdp'], value['type']);
    await _localPeerConnection.setRemoteDescription(description);
  }

  Future<void> addCandidate(Map<String, dynamic> value) async {
    final candidate = RTCIceCandidate(value['candidate'], value['sdpMid'], value['sdpMlineIndex']);
    await _localPeerConnection.addCandidate(candidate);
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
    unawaited(_localPeerConnection.dispose());
  }
}
