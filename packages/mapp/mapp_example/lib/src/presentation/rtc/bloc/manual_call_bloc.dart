import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapp_firebase_database/mapp_firebase_database.dart';

part 'manual_call_bloc.freezed.dart';

part 'manual_call_event.dart';

part 'manual_call_state.dart';

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

class ManualCallBloc extends Bloc<ManualCallEvent, ManualCallState> {
  IVideoCallRemoteDataSource videoCallRemoteDataSource;

  ManualCallBloc({
    required this.videoCallRemoteDataSource,
  }) : super(ManualCallState.initialize()) {
    on<ManualCallEvent>((events, emit) async {
      await events.map(
        init: (event) async => await _onInit(event, emit),
        createOffer: (event) async => await _onCreateOffer(event, emit),
        setRemoteDescription: (event) async => await _onSetRemoteDescription(event, emit),
        answerOffer: (event) async => await _onAnswerOffer(event, emit),
        addRemoteStream: (event) async => await _onAddRemoteStream(event, emit),
        addCandidate: (event) async => await _onAddCandidate(event, emit),
        disposeAll: (event) async => await _onDisposeAll(event, emit),
      );
    });
  }

  Future<void> _onInit(_Init event, Emitter<ManualCallState> emit) async {
    print("MASUK HALO");
    final caller = Platform.isIOS ? 'ios' : 'android';
    emit(state.copyWith(roomId: event.roomId, platformCaller: caller, info: 'SUCCESS INIT ROOM ID'));
    print("SUCCESS INIT ROOM ID");
  }

  Future<void> _onCreateOffer(_CreateOffer event, Emitter<ManualCallState> emit) async {
    try {
      final peerConnection = await createPeerConnection(configuration, offerSdpConstraints);
      emit(state.copyWith(peerConnection: peerConnection));
      final localStream = await _getLocalStream();
      emit(state.copyWith(localStream: localStream));
      for (var value in state.localStream?.getTracks() ?? <MediaStreamTrack>[]) {
        state.peerConnection?.addTrack(value, state.localStream!);
      }
      registerListener(isCaller: event.isCaller);
      if (event.isCaller) {
        final offer = await state.peerConnection!.createOffer({'offerToReceiveVideo': 1});
        await videoCallRemoteDataSource.videoCall2RoomRef
            .child(state.roomId!)
            .child('caller')
            .set(state.platformCaller!);
        await videoCallRemoteDataSource.videoCall2RoomRef.child(state.roomId!).child('callerOffer').set(offer.toMap());
        await state.peerConnection?.setLocalDescription(offer);
        emit(state.copyWith(info: 'SUCCESS CREATE OFFER'));
      } else {
        emit(state.copyWith(info: 'SUCCESSFULLY INIT CREATE OFFER'));
      }
    } on Exception catch (e) {
      emit(state.copyWith(info: '$e'));
    }
  }

  Future<MediaStream> _getLocalStream() async {
    return navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': {
        'facingMode': 'user',
      },
    });
  }

  int _callerCandidatesIndex = 0;
  int _receiverCandidatesIndex = 0;

  void registerListener({required bool isCaller}) {
    state.peerConnection?.onIceCandidate = (value) {
      if (value.candidate != null) {
        if (isCaller) {
          videoCallRemoteDataSource.videoCall2RoomRef
              .child(state.roomId!)
              .child('callerCandidates')
              .child('$_callerCandidatesIndex')
              .set(value.toMap());
          _callerCandidatesIndex++;
        } else {
          videoCallRemoteDataSource.videoCall2RoomRef
              .child(state.roomId!)
              .child('receiverCandidates')
              .child('$_receiverCandidatesIndex')
              .set(value.toMap());
          _receiverCandidatesIndex++;
        }
      }
    };

    state.peerConnection?.onIceGatheringState = (state) {
      print('LISTEN onIceGatheringState: $state');
    };

    state.peerConnection?.onIceConnectionState = (value) {
      print('LISTE onIceConnectionState: $value ${value.name}');
    };

    state.peerConnection?.onSignalingState = (value) {
      print('LISTEN onSignalingState: $value');
    };

    state.peerConnection?.onAddStream = (stream) {
      add(ManualCallEvent.addRemoteStream(stream: stream));
    };

    state.peerConnection?.onTrack = (event) {
      event.streams[0].getTracks().forEach((element) {
        state.remoteStream?.addTrack(element);
      });
    };
  }

  Future<void> _onAddRemoteStream(_AddRemoteStream event, Emitter<ManualCallState> emit) async {
    emit(state.copyWith(remoteStream: event.stream));
  }

  Future<void> _onSetRemoteDescription(_SetRemoteDescription event, Emitter<ManualCallState> emit) async {
    try {
      if (event.isCaller) {
        final answerDb =
            await videoCallRemoteDataSource.videoCall2RoomRef.child(state.roomId!).child('receiverAnswer').get();
        if (answerDb.value != null && answerDb.value is Map<dynamic, dynamic>) {
          final answerRaw = answerDb.value as Map<dynamic, dynamic>;
          Map<String, dynamic> answer = {};
          answerRaw.forEach((key, value) {
            answer['$key'] = value;
          });
          print("ANSWER VALUE: $answer");
          await state.peerConnection?.setRemoteDescription(RTCSessionDescription(answer['sdp'], answer['type']));
          emit(state.copyWith(info: 'SUCCESS SET ANSWER REMOTE DESCRIPTION'));
        }
      } else {
        final offerDb =
            await videoCallRemoteDataSource.videoCall2RoomRef.child(state.roomId!).child('callerOffer').get();
        if (offerDb.value != null && offerDb.value is Map<dynamic, dynamic>) {
          final offerRaw = offerDb.value as Map<dynamic, dynamic>;
          Map<String, dynamic> offer = {};
          offerRaw.forEach((key, value) {
            offer['$key'] = value;
          });
          print('OFFER VALUE: $offer');
          await state.peerConnection?.setRemoteDescription(RTCSessionDescription(offer['sdp'], offer['type']));
          emit(state.copyWith(info: 'SUCCESS SET OFFER REMOTE DESCRIPTION'));
        }
      }
    } on Exception catch (e) {
      emit(state.copyWith(info: 'GAGAL SET REMOTE DESCRIPTION: ${e}'));
    }
  }

  Future<void> _onAnswerOffer(_AnswerOffer event, Emitter<ManualCallState> emit) async {
    try {
      final answer = await state.peerConnection?.createAnswer({
        'offerToReceiveVideo': 1,
      });
      await videoCallRemoteDataSource.videoCall2RoomRef
          .child(state.roomId!)
          .child('receiverAnswer')
          .set(answer!.toMap());
      await state.peerConnection?.setLocalDescription(answer);
      emit(state.copyWith(info: 'SET ANSWER SUCCESS'));
    } on Exception catch (e) {
      emit(state.copyWith(info: 'GAGAL SET ANSWER: $e'));
    }
  }

  Future<void> _onAddCandidate(_AddCandidate event, Emitter<ManualCallState> emit) async {
    try {
      if (event.isCaller) {
        final room = await videoCallRemoteDataSource.videoCall2RoomRef.child(state.roomId!).get();
        final list = room.child('receiverCandidates').value as List<Object?>;
        for (var element in list) {
          if (element != null && element is Map<dynamic, dynamic>) {
            final mapRaw = element;
            Map<String, dynamic> map = {};
            mapRaw.forEach((key, value) {
              map['$key'] = value;
            });
            state.peerConnection!.addCandidate(RTCIceCandidate(map['candidate'], map['sdpMid'], map['sdpMlineIndex']));
          }
        }
        emit(state.copyWith(info: 'SUCCESS ADD CANDIDATE'));
      } else {
        final room = await videoCallRemoteDataSource.videoCall2RoomRef.child(state.roomId!).get();
        final list = room.child('callerCandidates').children.toList();
        for (var element in list) {
          if (element.value != null && element.value is Map<dynamic, dynamic>) {
            final mapRaw = element.value as Map<dynamic, dynamic>;
            Map<String, dynamic> map = {};
            mapRaw.forEach((key, value) {
              map['$key'] = value;
            });
            state.peerConnection!.addCandidate(RTCIceCandidate(map['candidate'], map['sdpMid'], map['sdpMlineIndex']));
          }
        }
        emit(state.copyWith(info: 'SUCCESS ADD CANDIDATE'));
      }
    } on Exception catch (e) {
      emit(state.copyWith(info: 'GAGAL ADD CANDIDATE: $e'));
    }
  }

  Future<void> _onDisposeAll(_DisposeAll event, Emitter<ManualCallState> emit) async {
    await state.localStream?.dispose();
    await state.remoteStream?.dispose();
    await state.peerConnection?.dispose();
    emit(state.copyWith(successDispose: true));
  }
}
