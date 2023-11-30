import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_example/src/domain/repositories/i_example_repository.dart';

part 'video_call_bloc.freezed.dart';

part 'video_call_event.dart';

part 'video_call_state.dart';

class VideoCallBloc extends Bloc<VideoCallEvent, VideoCallState> {
  IExampleRepository exampleRepository;

  VideoCallBloc({
    required this.exampleRepository,
  }) : super(VideoCallState.initialize()) {
    on<VideoCallEvent>((events, emit) async {
      await events.map(
        initializeConnection: (event) async => await _onInitializeConnection(event, emit),
      );
    });
  }

  Future<void> _onInitializeConnection(_InitializeConnection event, Emitter<VideoCallState> emit) async {
    try {
      emit(state.copyWith(initializeConnectionState: InitializeConnectionIdle()));
      final res = await exampleRepository.initializeConnection();
      res.fold(
        (l) => emit(state.copyWith(initializeConnectionState: InitializeConnectionFailed())),
        (r) => emit(state.copyWith(initializeConnectionState: InitializeConnectionSuccess(connectionResponse: r))),
      );
    } on Exception catch (e) {
      emit(state.copyWith(initializeConnectionState: InitializeConnectionFailed()));
    }
  }
}
