import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/data/dto/model/openvidu_remote_participant.dart';
import 'package:mapp_example/src/data/dto/model/openvidu_rtc_ice_candidate.dart';

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
  createdLocalOffer,
  localStreamAdded,
  webSocketDone,
  parsingHandleResultError,
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
  late String secret;

  Future<void> init({
    required String sessionId,
    required String sessionToken,
    required String secret,
  }) async {
    try {
      this.sessionId = sessionId;
      this.sessionToken = sessionToken;
      this.secret = secret;
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
  late int _idJoinRoom;
  late int _idPublishVideo;
  String? _localUserId;
  final List<Map<String, dynamic>> iceCandidatesParams = <Map<String, dynamic>>[];
  final Map<String, OpenviduRemoteParticipant> remoteParticipants = {};

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
    if (isOnWhitelistedSendJson(method)) {
      debugPrint('◤◢◤◢◤◢◤◢◤◢◤ SEND MESSAGE TO SOCKET METHOD: $method --> $jsonString | ◤◢◤◢◤◢◤◢◤◢◤');
    }
    return _internalId - 1;
  }

  bool isOnWhitelistedSendJson(String method) {
    if (method == JsonConstants.publishVideo) {
      return true;
    } else {
      return false;
    }
  }

  void updateInternalId() {
    _internalId++;
  }

  Future<void> onMessage(Map<String, dynamic> message) async {
    if (message.containsKey(JsonConstants.result)) {
      if (isOnWhiteListedOnMessage(message)) {
        debugPrint('◤◢◤◢◤◢◤◢◤◢◤  RESULT ON_MESSAGE_FROM_SOCKET : $message : ◤◢◤◢◤◢◤◢◤◢◤ ');
      }
      handleResult(id: message[JsonConstants.id], message: message, result: message[JsonConstants.result]);
    } else if (message.containsKey(JsonConstants.method)) {
      if (isOnWhiteListedOnMessage(message)) {
        debugPrint('◤◢◤◢◤◢◤◢◤◢◤  METHOD ON_MESSAGE_FROM_SOCKET : $message : ◤◢◤◢◤◢◤◢◤◢◤ ');
      }
      handleMethod(method: message[JsonConstants.method], params: message[JsonConstants.params]);
    }
  }

  void handleResult({required int id, required Map<String, dynamic> message, required Map<String, dynamic> result}) {
    try {
      if (id == _idJoinRoom) {
        _localUserId = result[JsonConstants.id];

        if (result.containsKey(JsonConstants.value)) {
          final values = (result[JsonConstants.value] as List<dynamic>).map((e) {
            final jsonString = json.encode(e);
            return json.decode(jsonString) as Map<String, dynamic>;
          }).toList();
          if (values.isNotEmpty) {
            final value = values.first;
            if (value.containsKey(JsonConstants.streams)) {
              final streams = (value[JsonConstants.streams] as List<dynamic>).map((e) {
                final jsonString = json.encode(e);
                return json.decode(jsonString) as Map<String, dynamic>;
              }).toList();

              if (streams.isNotEmpty) {
                final stream = streams.first;
              }

              for (final iceCandidate in iceCandidatesParams) {
                iceCandidate[JsonConstants.endpointName] = result['id'];
                iceCandidate[JsonConstants.id] = result['id'];
                sendJson(JsonConstants.iceCandidate, params: iceCandidate);
              }

              addParticipantAlreadyInRoom(values, streams);
            }
          }
        }
      }
    } catch (e) {
      debugPrint('ERROR PARSING HANDLE RESULT: $e');
      onRtcCallback(RTCState.parsingHandleResultError);
    }
  }

  void handleMethod({required String method, required Map<String, dynamic> params}) {
    if (method == JsonConstants.iceCandidate) {
      onIceCandidateMethod(params: params);
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
      } else if (message.containsKey(JsonConstants.method)) {
        if (message[JsonConstants.method] == JsonConstants.iceCandidate) {
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
    // debugPrint('MASUK_CREATE LOCAL PEER CONNECTION');
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
      final iceCandidateParams = <String, dynamic>{
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
        'endPointName': _localUserId,
        'candidate': candidate.candidate,
      };
      // debugPrint('MASUK_LOCAL PEER ON ICE CANDIDATE: $iceCandidateParams');
      sendJson(JsonConstants.onIceCandidate, params: iceCandidateParams);
      iceCandidatesParams.add(iceCandidateParams);
    };

    localPeerConnection.onIceGatheringState = (state) {
      debugPrint('MASUK_LOCAL PEER ON ICE GATHERING STATE: $state');
    };

    localPeerConnection.addStream(localStream);
    onLocalStream(localStream);
    onRtcCallback(RTCState.localStreamAdded);

    onRtcCallback(RTCState.createdPeerConnection);
    _idJoinRoom = sendJson(
      JsonConstants.joinRoom,
      params: {
        JsonConstants.metadata: '{"clientData": "MOBILE CLIENT"}',
        'secret': secret,
        'platform': Platform.isAndroid ? 'Android' : 'iOS',
        // 'dataChannels': 'false',
        'session': sessionId,
        'token': sessionToken,
      },
    );
    return localPeerConnection;
  }

  late RTCSessionDescription localOffer;

  Future<RTCSessionDescription> createLocalOffer() async {
    debugPrint('MASUK_CREATE LOCAL PEER CONNECTION');
    localOffer = await localPeerConnection.createOffer({'offerToReceiveVideo': 1});
    await localPeerConnection.setLocalDescription(localOffer);
    _idPublishVideo = sendJson(
      JsonConstants.publishVideo,
      params: {
        'audioOnly': 'false',
        'hasAudio': 'true',
        'doLoopback': 'false',
        'hasVideo': 'true',
        'audioActive': 'true',
        'videoActive': 'true',
        'typeOfVideo': 'CAMERA',
        'frameRate': '30',
        'videoDimensions': '{"width": 320, "height": 240}',
        'sdpOffer': localOffer.sdp
      },
    );
    onRtcCallback(RTCState.createdLocalOffer);
    return localOffer;
  }

  Future<void> dispose() async {
    webSocket.close();
  }

  void onIceCandidateMethod({required Map<String, dynamic> params}) {
    final iceCandidateParams = OpenviduRTCIceCandidate(
        candidate: params['candidate'],
        sdpMid: params['sdpMid'],
        sdpMLineIndex: params['sdpMLineIndex'],
        endpointName: params['endpointName']);
    // debugPrint('MASUK_ON ICE CANDIDATE METHOD: ${iceCandidateParams.toMap()}');
    final isLocal = params[JsonConstants.senderConnectionId] == _localUserId;
    if (isLocal) {
      localPeerConnection.addCandidate(iceCandidateParams);
    }
  }

  void addParticipantAlreadyInRoom(List<Map<String, dynamic>> values, List<Map<String, dynamic>> streams) {
    if (values.isNotEmpty && streams.isNotEmpty) {
      final value = values.first;
      final stream = streams.first;

      final remoteParticipantId = '${value[JsonConstants.id]}';
      final metaData = value[JsonConstants.metadata];
      final isVideoActive = value[JsonConstants.videoActive];
      final isAudioActive = value[JsonConstants.audioActive];

      final remoteParticipant = OpenviduRemoteParticipant(
        id: remoteParticipantId,
        streamId: stream[JsonConstants.id],
        isVideoActive: isVideoActive,
        isAudioActive: isAudioActive,
      );

      remoteParticipants[remoteParticipantId] = remoteParticipant;
      createRemotePeerConnection(remoteParticipant).then((value){

      });

      debugPrint('MASUK VALUE: $value');
      debugPrint('MASUK STREAM: $stream');
    }
  }

  Future<RTCPeerConnection> createRemotePeerConnection(OpenviduRemoteParticipant remoteParticipant) async {
    final remotePeerConnection = await createPeerConnection(configuration, offerSdpConstraints);
    remotePeerConnection.onIceCandidate = (candidate){
      final iceCandidateParams = <String, dynamic>{
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
        'endpointName': remoteParticipant.streamId,
        'candidate': candidate.candidate,
      };
      debugPrint('MASUK_REMOTE PEER CONNECTION: $iceCandidatesParams');
      sendJson(JsonConstants.iceCandidate, params: iceCandidateParams);
    };
    return remotePeerConnection;
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
