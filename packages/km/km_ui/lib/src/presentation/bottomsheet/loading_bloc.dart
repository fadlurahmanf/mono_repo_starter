import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_bloc.freezed.dart';

part 'loading_event.dart';

part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  Timer? _timer;

  LoadingBloc() : super(LoadingState.initialize()) {
    on<LoadingEvent>((events, emit) async {
      await events.map(
          setTimer: (event) async => await _setTimer(event, emit),
          setLoadingInAWhile: (event) async => await _setLoadingInAWhile(event, emit));
    });
  }

  Future<void> _setTimer(_SetTimer event, Emitter<LoadingState> emit) async {
    _timer = event.timer;
  }

  Future<void> _setLoadingInAWhile(_SetLoadingInAWhile event, Emitter<LoadingState> emit) async {
    _timer?.cancel();
    emit(state.copyWith(showLoadingInAWhile: true));
  }
}
