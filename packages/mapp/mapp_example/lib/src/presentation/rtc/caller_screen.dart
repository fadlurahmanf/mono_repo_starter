import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/rtc_service.dart';
import 'package:mapp_firebase_database/mapp_firebase_database.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';

class CallerScreen extends StatefulWidget with WrapperState {
  const CallerScreen({super.key});

  @override
  State<CallerScreen> createState() => _CallerScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => context.get<VideoCallBloc>(),
      child: this,
    );
  }
}

class _CallerScreenState extends State<CallerScreen> {
  final localRenderer = RTCVideoRenderer();
  final remoteRenderer = RTCVideoRenderer();
  late RTCService rtcService;
  List<Map<String, dynamic>> receiverCandidates = [];
  bool isCaller = true;
  List<Map<String, dynamic>> callerCandidates = [];

  String roomId = '';

  @override
  void initState() {
    super.initState();
    final arg = context.getArgument() as Map<String, dynamic>;
    isCaller = arg['isCaller'] == true;
    roomId = arg['roomId'] ?? generateRoomId();
    rtcService = RTCService(
      onLocalStream: (stream) => onLocalStream(context, stream: stream),
      onIceCandidate: (map, stringCandidate) {
        if (isCaller) {
          context
              .get<IVideoCallRemoteDataSource>()
              .videoCallRef
              .child('rooms')
              .child(roomId)
              .child('callerCandidates')
              .set(callerCandidates..add(map));
        } else {
          context
              .get<IVideoCallRemoteDataSource>()
              .videoCallRef
              .child('rooms')
              .child(roomId)
              .child('receiverCandidates')
              .set(receiverCandidates..add(map));
        }
      },
      onLocalPeerConnectionReady: () {
        if (isCaller) {
          rtcService.createLocalOffer();
        } else {
          listenAsReceiver();
        }
      },
      onRemoteStream: (stream) => onRemoteStream(context, stream: stream),
      onLocalOffer: (map, stringifyMap) {
        if (isCaller) {
          context
              .get<IVideoCallRemoteDataSource>()
              .videoCallRef
              .child('rooms')
              .child(roomId)
              .child('callerOffer')
              .set(map);
          listenAsCaller();
        }
      },
      onRemoteAnswer: (map, stringifyMap) {
        if (!isCaller) {
          context
              .get<IVideoCallRemoteDataSource>()
              .videoCallRef
              .child('rooms')
              .child(roomId)
              .child('receiverAnswer')
              .set(map);
        }
      },
    );
    initRenderers();
    rtcService.initLocalPeerConnection();
  }

  Future<void> initListenerDatabase() async {}

  @override
  void dispose() {
    // context.get<IVideoCallRemoteDataSource>().videoCallRef.child('rooms').child(roomId).remove();
    unawaited(localRenderer.dispose());
    unawaited(remoteRenderer.dispose());
    unawaited(rtcService.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(roomId),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: fullView(context),
            ),
            Positioned(
              left: 5.w,
              top: 10.h,
              child: smallRTCView(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
  }

  Widget smallRTCView(BuildContext context) {
    return BlocBuilder<VideoCallBloc, VideoCallState>(builder: (context, state) {
      if (state.localStreamId != null) {
        return Container(
          width: 35.w,
          height: 25.h,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15.sp)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: RTCVideoView(
              localRenderer,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget fullView(BuildContext context) {
    return BlocBuilder<VideoCallBloc, VideoCallState>(builder: (context, state) {
      if((state.remoteStreamIds??[]).isNotEmpty){
        return Container(
          color: Colors.red,
            child: RTCVideoView(remoteRenderer, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,),
        );
      }else{
        return Container(
          decoration: const BoxDecoration(color: Colors.black),
        );
      }
    });
  }

  void onLocalStream(BuildContext context, {required MediaStream stream}) {
    print("MASUK ON LOCAL STREAM ${stream.id}");
    localRenderer.setSrcObject(stream: stream);
    context.read<VideoCallBloc>().add(VideoCallEvent.setLocalParticipant(id: stream.id));
  }

  void onRemoteStream(BuildContext context, {required MediaStream stream}) {
    print("MASUK ON REMOTE STREAM ${stream.id}");
    remoteRenderer.srcObject = stream;
    context.read<VideoCallBloc>().add(VideoCallEvent.addRemoteParticipant(id: stream.id));
  }

  String generateRoomId() {
    const char = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        15,
        (_) => char.codeUnitAt(Random().nextInt(char.length)),
      ),
    );
  }

  Stream<DatabaseEvent>? receiverCandidatesSub;

  Future<void> listenAsReceiver() async {
    final roomRef = context.get<IVideoCallRemoteDataSource>().videoCallRoomRef.child(roomId);
    final room = await roomRef.get();
    final offer = room.child(roomId).child('callerOffer').value;
    Map<String, dynamic> offerJs = {};
    if(offer is Map<dynamic, dynamic>){
      offer.forEach((key, value) {
        offerJs['$key'] = value;
      });
    }
    await rtcService.setRemoteDescription(offerJs);
    await rtcService.createAnswer();

    callerCandidatesSub = roomRef.child('callerCandidates').onChildAdded;
    callerCandidatesSub?.listen((event) {
      final map = event.snapshot.value;
      Map<String, dynamic> mapJs = {};
      (map as Map<dynamic, dynamic>).forEach((key, value) {
        mapJs['$key'] = value;
      });
      print("MASUK CALLER CANDIDATES: ${mapJs}");
      rtcService.addCandidate(mapJs);
    });
  }

  Stream<DatabaseEvent>? roomChildAdded;
  Stream<DatabaseEvent>? callerCandidatesSub;

  Future<void> listenAsCaller() async {
    final roomRef = context.get<IVideoCallRemoteDataSource>().videoCallRoomRef.child(roomId);
    roomChildAdded = roomRef.onChildAdded;
    roomChildAdded?.listen((event) async {
      print("MASUK receiverAnswer onChildAdded: ${event.snapshot.key}");
      print("MASUK receiverAnswer onChildAdded: ${event.snapshot.value}");
      if(event.snapshot.key == 'receiverAnswer'){
        var receiverAnswer = event.snapshot.value;
        Map<String, dynamic> answerJs = {};
        (receiverAnswer as Map<dynamic, dynamic>).forEach((key, value) {
          answerJs['$key'] = value;
        });
        print("MASUK DALEM: $answerJs");
        await rtcService.setRemoteDescription(answerJs);
      }
    });
    receiverCandidatesSub =
        context.get<IVideoCallRemoteDataSource>().videoCallRoomRef.child(roomId).child('receiverCandidates').onChildAdded;
    receiverCandidatesSub?.listen((event) async {
      final map = event.snapshot.value;
      Map<String, dynamic> mapJs = {};
      (map as Map<dynamic, dynamic>).forEach((key, value) {
        mapJs['$key'] = value;
      });
      print("MASUK RECEIVER CANDIDATE: $mapJs");
      rtcService.addCandidate(mapJs);
    });
  }
}
