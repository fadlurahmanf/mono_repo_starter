import 'dart:async';
import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/rtc_service.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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

  String sessionId = '';
  String connectionId = '';
  String sessionToken = '';

  @override
  void initState() {
    super.initState();
    localRenderer.initialize();
    remoteRenderer.initialize();

    rtcService = RTCService(
      onRtcCallback: (state) {
        switch (state) {
          case RTCState.initializeWebSocket:
            Get.snackbar('RTC STATE', 'initializeWebSocket');
            break;
          case RTCState.createdPeerConnection:
            Get.snackbar('RTC STATE', 'createdPeerConnection');
            break;
          case RTCState.localStreamAdded:
            Get.snackbar('RTC STATE', 'localStreamAdded');
            break;
          case RTCState.webSocketDone:
            Get.snackbar('RTC STATE', 'webSocketDone');
            break;
          case RTCState.webSocketError:
            Get.snackbar('RTC STATE', 'webSocketError');
            break;
        }
      },
      onLocalStream: (stream) {
        setState(() {
          localStream = stream;
          localRenderer.srcObject = localStream;
        });
      },
    );
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
    return MultiBlocListener(
        listeners: [
          BlocListener<VideoCallBloc, VideoCallState>(
              listenWhen: (previous, current) =>
                  previous.initializeConnectionState != current.initializeConnectionState,
              listener: (context, state) {
                final connectionState = state.initializeConnectionState;
                if (connectionState is InitializeConnectionLoading) {
                  Get.snackbar('LOADING', 'LOADING');
                } else if (connectionState is InitializeConnectionSuccess) {
                  if (connectionState.connectionResponse.id != null &&
                      connectionState.connectionResponse.token != null) {
                    setState(() {
                      sessionId = connectionState.connectionResponse.sessionId!;
                      sessionToken = connectionState.connectionResponse.token!;
                      connectionId = connectionState.connectionResponse.id ?? '-';
                    });
                    Get.snackbar('SUCCESS', 'SUCCESS');
                  }
                } else if (connectionState is InitializeConnectionFailed) {
                  Get.snackbar('FAILED', 'FAILED');
                }
              })
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('ROOM ID: $sessionId'),
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
                      Text('CON_ID: $connectionId'),
                      SizedBox(
                        height: 5.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          context.read<VideoCallBloc>().add(const VideoCallEvent.initializeConnection());
                        },
                        child: const Text('INIT CONNECTION THROUGH API'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          rtcService.init(sessionId: sessionId, sessionToken: sessionToken);
                        },
                        child: const Text('INIT RTC SERVICE'),
                      ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('ADD CANDIDATE 7'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('MUTE'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('UNMUTE'),
                      // ),
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
                        height: 5.h,
                      ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('CREATE LOCAL OFFER 2'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('SET REMOTE DESCRIPTION BASED ON OFFER 3'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('CREATE ANSWER 4'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('ADD CANDIDATE 5'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('MUTE'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('UNMUTE'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('ENABLE SPEAKER'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () async {},
                      //   child: const Text('DISABLE SPEAKER'),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
