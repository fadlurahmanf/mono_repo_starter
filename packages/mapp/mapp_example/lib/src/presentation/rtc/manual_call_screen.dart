import 'package:flutter/material.dart';
import 'package:core_config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/manual_call_bloc.dart';
import 'package:sizer/sizer.dart';

class ManualCallScreen extends StatefulWidget with WrapperState {
  const ManualCallScreen({super.key});

  @override
  State<ManualCallScreen> createState() => _ManualCallScreenState();

  @override
  Widget wrap(BuildContext context) {
    return BlocProvider<ManualCallBloc>(
      create: (context) => context.get<ManualCallBloc>(),
      child: this,
    );
  }
}

class _ManualCallScreenState extends State<ManualCallScreen> {
  final localRenderer = RTCVideoRenderer();
  final remoteRenderer = RTCVideoRenderer();

  String roomId = '';

  @override
  void initState() {
    super.initState();
    final arg = context.getArgument() as Map<String, dynamic>;
    roomId = arg['roomId'];
    initRenderers();
  }

  Future<void> initRenderers() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();
    if (context.mounted) {
      context.showSnackBar('SUCCESS RENDERING');
      print("MASUK TES SINI");
      context.read<ManualCallBloc>().add(ManualCallEvent.init(roomId: roomId));
    }
  }

  @override
  void dispose() {
    localRenderer.dispose();
    remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<ManualCallBloc, ManualCallState>(
              // listenWhen: (previous, current) => previous.info != current.info && current.info != null,
              listener: (context, state) {
                print("MASUK STATE: ${state.roomId}");
                context.showSnackBar(state.info ?? "");
              }),
          BlocListener<ManualCallBloc, ManualCallState>(
              listenWhen: (previous, current) => previous.localStream != current.localStream,
              listener: (context, state) {
                if (state.localStream != null) {
                  localRenderer.srcObject = state.localStream;
                }
              }),
          BlocListener<ManualCallBloc, ManualCallState>(
              listenWhen: (previous, current) => previous.localStream != current.remoteStream,
              listener: (context, state) {
                if (state.remoteStream != null) {
                  remoteRenderer.setSrcObject(stream: state.remoteStream!);
                }
              }),
          BlocListener<ManualCallBloc, ManualCallState>(
              listenWhen: (previous, current) => previous.successDispose != current.successDispose,
              listener: (context, state) {
                if (state.successDispose == true) {
                  context.showSnackBar('SUCCESS DISPOSE');
                  context.back();
                }
              })
        ],
        child: WillPopScope(
            child: Scaffold(
              appBar: AppBar(
                title: BlocBuilder<ManualCallBloc, ManualCallState>(
                  builder: (context, state) {
                    return Text(state.roomId ?? '-');
                  },
                ),
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
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.createOffer(isCaller: true));
                            },
                            child: const Text('CREATE LOCAL OFFER 1'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.setRemoteDescription(
                                    isCaller: true,
                                  ));
                            },
                            child: const Text('SET REMOTE DESCRIPTION BASED ANSWER 5'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.addCandidate(
                                    isCaller: true,
                                  ));
                            },
                            child: const Text('ADD CANDIDATE 6'),
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
                              context.read<ManualCallBloc>().add(const ManualCallEvent.createOffer(
                                    isCaller: false,
                                  ));
                            },
                            child: const Text('CREATE LOCAL OFFER 2'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.setRemoteDescription(
                                    isCaller: false,
                                  ));
                            },
                            child: const Text('SET REMOTE DESCRIPTION BASED ON OFFER 2'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.answerOffer());
                            },
                            child: const Text('CREATE ANSWER 3'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              context.read<ManualCallBloc>().add(const ManualCallEvent.addCandidate(isCaller: false));
                            },
                            child: const Text('ADD CANDIDATE 4'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onWillPop: () async {
              if (context.mounted) {
                context.read<ManualCallBloc>().add(const ManualCallEvent.disposeAll());
              }
              return false;
            }));
  }

  Widget _local(BuildContext context) {
    return BlocBuilder<ManualCallBloc, ManualCallState>(
      builder: (context, state) {
        if (state.localStream != null) {
          return RTCVideoView(
            localRenderer,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }

  Widget _remote(BuildContext context) {
    return BlocBuilder<ManualCallBloc, ManualCallState>(
      builder: (context, state) {
        if (state.remoteStream != null) {
          return RTCVideoView(
            remoteRenderer,
            objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
