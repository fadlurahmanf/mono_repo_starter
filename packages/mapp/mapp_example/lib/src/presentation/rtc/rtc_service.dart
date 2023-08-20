import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

class RTCService {
  void Function(MediaStream) onLocalStream;
  void Function(MediaStream) onRemoteStream;
  void Function(Map<String, dynamic>) onLocalOffer;
  void Function(Map<String, dynamic>) onRemoteAnswer;

  void Function() onLocalPeerConnectionReady;

  void Function(Map<String, dynamic>) onIceCandidate;

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
        final js =
            json.encode({'candidate': value.candidate, 'sdpMid': value.sdpMid, 'sdpMlineIndex': value.sdpMLineIndex});
        print('onIceCandidate: $js');
      }
    };

    peerConnection.onIceConnectionState = (value) {
      print('onIceConnectionState: $value');
    };

    peerConnection.onAddStream = (stream) {
      stream.getTracks().forEach((element) {
        peerConnection.addTrack(element, stream);
      });
      onRemoteStream(stream);
    };
    _localPeerConnection = peerConnection;
    onLocalPeerConnectionReady();
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
    onRemoteAnswer(parse(sessionDescription.sdp ?? ''));
    await _localPeerConnection!.setLocalDescription(sessionDescription);
  }

  Future<void> setRemoteDescription(Map<String, dynamic> value) async {
    if (_localPeerConnection == null) {
      print('LOCAL PEER CONNECTION NULL');
      return;
    }
    print("MASUK VALUE REMOTE DESCRIPTION: $value");
    String sdp = write(value, null);
    print("MASUK VALUE SDP: $value");
    final description = RTCSessionDescription(sdp, 'answer');
    print("MASUK DESCRIPTION: ${_localPeerConnection != null}");
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
