import 'dart:async';
import 'dart:math';

import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/rtc_service.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  MediaStream? localStream;
  MediaStream? remoteStream;
  late RTCService rtcService;
  List<Map<String, dynamic>> receiverCandidates = [];
  bool isCaller = true;
  List<Map<String, dynamic>> callerCandidates = [];

  String roomId = '';

  @override
  void initState() {
    super.initState();
    localRenderer.initialize();
    remoteRenderer.initialize();

    rtcService = RTCService();
  }

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 35.w,
                    height: 25.h,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15.sp)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: _local(context),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('CREATE LOCAL OFFER 1'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('SET REMOTE DESCRIPTION BASED ANSWER 6'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('ADD CANDIDATE 7'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('MUTE'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('UNMUTE'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 35.w,
                    height: 25.h,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15.sp)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: _remote(context),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('CREATE LOCAL OFFER 2'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('SET REMOTE DESCRIPTION BASED ON OFFER 3'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: const Text('CREATE ANSWER 4'),
                  ),
                  ElevatedButton(
                    onPressed: () async {

                    },
                    child: const Text('ADD CANDIDATE 5'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: const Text('MUTE'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: const Text('UNMUTE'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: const Text('ENABLE SPEAKER'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    },
                    child: const Text('DISABLE SPEAKER'),
                  ),
                ],
              ),
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

  Widget _local(BuildContext context) {
    if (localStream != null) {
      return RTCVideoView(
        localRenderer,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }

  Widget _remote(BuildContext context) {
    if (remoteStream != null) {
      return RTCVideoView(
        remoteRenderer,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
}
