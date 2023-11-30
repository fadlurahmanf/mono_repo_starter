import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

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

enum RTCState {
  initializeWebSocket,
  createdPeerConnection,
  localStreamAdded,
  webSocketDone,
  webSocketError,
}

class RTCService {
  Function(RTCState state) onRtcCallback;
  Function(MediaStream stream) onLocalStream;

  RTCService({
    required this.onRtcCallback,
    required this.onLocalStream,
  });

  late WebSocket webSocket;
  late String sessionId;
  late String sessionToken;

  Future<void> init({required String sessionId, required String sessionToken}) async {
    try {
      this.sessionId = sessionId;
      this.sessionToken = sessionId;
      webSocket =
          await WebSocket.connect('wss://vc.bankmas.my.id:443/openvidu?sessionId=$sessionId&token=$sessionToken');
      debugPrint('CONNECT TO: wss://vc.bankmas.my.id:443/openvidu?sessionId=$sessionId&token=$sessionToken');

      onRtcCallback(RTCState.initializeWebSocket);

      webSocket.listen((event) {
        final jsonMessage = json.decode(event);
        onMessage(jsonMessage);
      }, onDone: () {
        onRtcCallback(RTCState.webSocketDone);
        _timer?.cancel();
      });

      await createLocalPeerConnection();
      startPingTimer();
    } catch (e) {
      debugPrint('MASUK_WEBSOCKET ERROR: $e');
      onRtcCallback(RTCState.webSocketError);
      _timer?.cancel();
    }
  }

  Timer? _timer;

  void startPingTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      sendJson(
        'ping',
        params: {
          'interval': '3000',
        },
      );
    });
  }

  int _internalId = 1;

  int sendJson(String method, {Map<String, dynamic>? params}) {
    final dict = <String, dynamic>{};
    dict[JsonConstants.method] = method;
    dict[JsonConstants.id] = _internalId;
    dict['jsonrpc'] = '2.0';
    if ((params?.length ?? 0) > 0) {
      dict[JsonConstants.params] = params;
    }
    updateInternalId();
    final jsonString = json.encode(dict);
    webSocket.add(jsonString);
    return _internalId - 1;
  }

  void updateInternalId() {
    _internalId++;
  }

  Future<void> onMessage(Map<String, dynamic> message) async {
    if (isOnWhiteListedOnMessage(message)) {
      debugPrint('◤◢◤◢◤◢◤◢◤◢◤  ON_MESSAGE_FROM_SOCKET : $message : ◤◢◤◢◤◢◤◢◤◢◤ ');
    }
  }

  bool isOnWhiteListedOnMessage(Map<String, dynamic> message) {
    try {
      if (message.containsKey(JsonConstants.result)) {
        final resultJson = message[JsonConstants.result] as Map<String, dynamic>;
        if (resultJson[JsonConstants.value] == 'pong') {
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  late RTCPeerConnection localPeerConnection;
  late MediaStream localStream;

  Future<RTCPeerConnection> createLocalPeerConnection() async {
    debugPrint('MASUK_CREATE LOCAL PEER CONNECTION');
    localPeerConnection = await createPeerConnection(configuration, offerSdpConstraints);
    localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': {
        'facingMode': 'user',
      },
    });
    for (var value in localStream.getTracks()) {
      localPeerConnection.addTrack(value, localStream);
    }

    localPeerConnection.onIceCandidate = (candidate) {
      debugPrint('MASUK_LOCAL PEER ON ICE CANDIDATE');
      sendJson(JsonConstants.onIceCandidate, params: candidate.toMap());
    };

    localPeerConnection.onIceGatheringState = (state) {
      debugPrint('MASUK_LOCAL PEER ON ICE GATHERING STATE: $state');
    };

    localPeerConnection.addStream(localStream);
    onLocalStream(localStream);
    onRtcCallback(RTCState.localStreamAdded);

    onRtcCallback(RTCState.createdPeerConnection);

    return localPeerConnection;
  }

  Future<void> dispose() async {
    webSocket.close();
  }
}

class JsonConstants {
  static const String value = 'value';
  static const String params = 'params';
  static const String method = 'method';
  static const String id = 'id';
  static const String result = 'result';
  static const String iceCandidate = 'iceCandidate';
  static const String participantJoined = 'participantJoined';
  static const String participantEvicted = 'participantEvicted';
  static const String participantUnpublished = 'participantUnpublished';
  static const String streamPropertyChanged = 'streamPropertyChanged';
  static const String sendMessage = 'sendMessage';
  static const String participantPublished = 'participantPublished';
  static const String participantLeft = 'participantLeft';
  static const String sessionId = 'sessionId';
  static const String sdpAnswer = 'sdpAnswer';
  static const String joinRoom = 'joinRoom';
  static const String metadata = 'metadata';
  static const String publishVideo = 'publishVideo';
  static const String onIceCandidate = 'onIceCandidate';
  static const String receiveVideoFrom = 'receiveVideoFrom';
  static const String endpointName = 'endpointName';
  static const String senderConnectionId = 'senderConnectionId';
  static const String connectionId = 'connectionId';
  static const String leaveRoom = 'leaveRoom';
  static const String streams = 'streams';
  static const String audioActive = 'audioActive';
  static const String videoActive = 'videoActive';
  static const String property = 'property';
  static const String newValue = 'newValue';
}
