import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_call_bloc.freezed.dart';

part 'video_call_event.dart';

part 'video_call_state.dart';

class VideoCallBloc extends Bloc<VideoCallEvent, VideoCallState> {
  VideoCallBloc() : super(VideoCallState.initialize()) {
    on<VideoCallEvent>((events, emit) async {
      await events.map(
        setLocalParticipant: (event) async => await _onsetLocalParticipant(event, emit),
        addRemoteParticipant: (event) async => await _onAddRemoteParticipant(event, emit),
      );
    });
  }

  Future<void> _onsetLocalParticipant(_SetLocalParticipant event, Emitter<VideoCallState> emit) async {
    emit(state.copyWith(localStreamId: event.id));
  }

  Future<void> _onAddRemoteParticipant(_AddRemoteParticipant event, Emitter<VideoCallState> emit) async {
    emit(state.copyWith(remoteStreamIds: [event.id]));
  }
}
