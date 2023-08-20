import 'dart:async';
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
            .child('caller')
            .child('candidates')
            .set(candidates..add(map));
      },
      onLocalPeerConnectionReady: () {},
      onRemoteStream: (stream) => onRemoteStream(context, stream: stream),
      onLocalOffer: (sdp, stringSdp) {
        context.get<IVideoCallRemoteDataSource>().videoCallReference.child('caller').child('offer').set(sdp);
      },
      onRemoteAnswer: (sdp, stringSdp) {
        // context.get<IVideoCallRemoteDataSource>().videoCallReference.child('caller').child('answer').set(sdp);
      },
    );
    initListenerDatabase(context);
    initRenderers();
    rtcService.init();
  }

  Stream<DatabaseEvent>? receiverChildAddedSub;
  late String localPlatform;
  late String remotePlatform;

  Future<void> initListenerDatabase(BuildContext context) async {
    if (mounted) {
      localPlatform = Platform.isIOS ? 'ios' : 'android';
      remotePlatform = Platform.isIOS ? 'android' : 'ios';
      receiverChildAddedSub = context.get<IVideoCallRemoteDataSource>().onKReceiverChildAdded;
      receiverChildAddedSub?.listen((event) {
        if (event.snapshot.hasChild('answer') && event.type == DatabaseEventType.childAdded) {
          final answer = event.snapshot.child('answer');
          print("MASUK ANSWER RECEIVER: $answer");
          if (answer is Map<dynamic, dynamic>) {
            Map<String, dynamic> answerJs = {};
            answerJs.forEach((key, value) {
              answerJs['$key'] = value;
            });
            rtcService.setRemoteDescription(answerJs);
          }
        } else if (event.snapshot.hasChild('candidates') && event.type == DatabaseEventType.childAdded) {
          event.snapshot.children.forEach((e) {
            final value = e.value as Map<dynamic, dynamic>;
            Map<String, dynamic> newMap = {};
            value.forEach((key, value) {
              newMap['$key'] = value;
            });
            rtcService.addCandidate(newMap);
          });
        }
      });
    }
  }

  @override
  void dispose() {
    context.get<IVideoCallRemoteDataSource>().videoCallReference.child('caller').remove();
    unawaited(localRenderer.dispose());
    unawaited(remoteRenderer.dispose());
    unawaited(rtcService.dispose());
    receiverChildAddedSub?.distinct();
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
      return Container(
        decoration: const BoxDecoration(color: Colors.black),
      );
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
