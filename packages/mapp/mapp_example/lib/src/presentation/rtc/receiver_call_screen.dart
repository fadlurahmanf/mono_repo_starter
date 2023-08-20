import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/rtc_service.dart';
import 'package:mapp_firebase_database/mapp_firebase_database.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';

class ReceiverCallScreen extends StatefulWidget with WrapperState {
  const ReceiverCallScreen({super.key});

  @override
  State<ReceiverCallScreen> createState() => _ReceiverCallScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => context.get<VideoCallBloc>(),
      child: this,
    );
  }
}

class _ReceiverCallScreenState extends State<ReceiverCallScreen> {
  final localRenderer = RTCVideoRenderer();
  final remoteRenderer = RTCVideoRenderer();

  late RTCService rtcService;
  List<Map<String, dynamic>> candidates = [];

  @override
  void initState() {
    super.initState();
    rtcService = RTCService(
      onLocalStream: (stream) => onLocalStream(context, stream: stream),
      onIceCandidate: (map, stringCandidate) {
        context
            .get<IVideoCallRemoteDataSource>()
            .videoCallReference
            .child('receiver')
            .child('candidates')
            .set(candidates..add(map));
      },
      onLocalPeerConnectionReady: () {
        callerChildOnValueListen?.listen((event) {
          final offer = event.snapshot.child('offer').value;
          print("MASUK OFFER LISTEN: ${offer}");
          if (offer != null && offer is Map<dynamic, dynamic>) {
            Map<String, dynamic> offerJs = {};
            offer.forEach((key, value) {
              offerJs['$key'] = value;
            });
            rtcService.setRemoteDescription(offerJs).then((value) {
              rtcService.createAnswer();
            });
          }
          final candidates = event.snapshot.child('candidates').children;
          for(int i=0; i<candidates.length; i++){
            final value = event.snapshot.child('candidates').child('$i').value as Map<dynamic, dynamic>;
            Map<String, dynamic> newMap = {};
            value.forEach((key, value) {
              newMap['$key'] = value;
            });
            rtcService.addCandidate(newMap);
          }
        });
      },
      onRemoteStream: (stream) => onRemoteStream(context, stream: stream),
      onLocalOffer: (map, stringifyMap) {
        // context.get<IVideoCallRemoteDataSource>().videoCallReference.child('receiver').child('offer').set(map);
      },
      onRemoteAnswer: (map, stringifyMap) {
        context.get<IVideoCallRemoteDataSource>().videoCallReference.child('receiver').child('answer').set(map);
      },
    );
    initListenerDatabase(context);
    initRenderers();
    rtcService.init();
  }

  Stream<DatabaseEvent>? callerChildOnValueListen;
  late String localPlatform;
  late String remotePlatform;

  Future<void> initListenerDatabase(BuildContext context) async {
    if (mounted) {
      localPlatform = Platform.isIOS ? 'ios' : 'android';
      remotePlatform = Platform.isIOS ? 'android' : 'ios';
      callerChildOnValueListen = context.get<IVideoCallRemoteDataSource>().callerDb.onValue;
    }
  }

  @override
  void dispose() {
    context.get<IVideoCallRemoteDataSource>().videoCallReference.child('receiver').remove();
    unawaited(localRenderer.dispose());
    unawaited(remoteRenderer.dispose());
    unawaited(rtcService.dispose());
    callerChildOnValueListen?.distinct();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      if ((state.remoteStreamIds ?? []).isNotEmpty) {
        return Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: RTCVideoView(remoteRenderer),
        );
      } else {
        return Container(
          decoration: const BoxDecoration(color: Colors.black),
        );
      }
    });
  }

  void onLocalStream(BuildContext context, {required MediaStream stream}) {
    localRenderer.setSrcObject(stream: stream);
    context.read<VideoCallBloc>().add(VideoCallEvent.setLocalParticipant(id: stream.id));
  }

  onRemoteStream(BuildContext context, {required MediaStream stream}) {
    remoteRenderer.setSrcObject(stream: stream);
    context.read<VideoCallBloc>().add(VideoCallEvent.addRemoteParticipant(id: stream.id));
  }
}
