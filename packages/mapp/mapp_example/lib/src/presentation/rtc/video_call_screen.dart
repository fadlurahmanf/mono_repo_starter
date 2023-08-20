import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/rtc_service.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoCallScreen extends StatefulWidget with WrapperState {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider(
      create: (context) => context.get<VideoCallBloc>(),
      child: this,
    );
  }
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final localRenderer = RTCVideoRenderer();
  final remoteRenderer = RTCVideoRenderer();

  late RTCService rtcService;

  @override
  void initState() {
    super.initState();
    rtcService = RTCService(
      onLocalStream: (stream) => onLocalStream(context, stream: stream),
    );
    initRenderers();

    rtcService.initLocalUserMedia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
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
          decoration: BoxDecoration(
            color: Colors.black,
              borderRadius: BorderRadius.circular(15.sp)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.sp),
            child: RTCVideoView(localRenderer, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,),
        ),
      );
      } else {
      return Container();
      }
    });
  }

  void onLocalStream(BuildContext context, {required MediaStream stream}) {
    localRenderer.setSrcObject(stream: stream);
    context.read<VideoCallBloc>().add(VideoCallEvent.setLocalParticipant(id: stream.id));
  }
}
