import 'package:core/core.dart';
import 'package:core_applink/src/domain/common/i_core_applink_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_applink_bloc.freezed.dart';

part 'core_applink_event.dart';

part 'core_applink_state.dart';

class CoreAppLinkBloc extends Bloc<CoreAppLinkEvent, CoreAppLinkState> {
  ICoreAppLinkRepository coreAppLinkRepository;

  CoreAppLinkBloc({required this.coreAppLinkRepository}) : super(CoreAppLinkState.initialize()) {
    on<CoreAppLinkEvent>((events, emit) async {
      await events.map(
        listen: (event) async => await _uriListener(event, emit),
        process: (event) async => await _process(event, emit),
      );
    });
  }

  Future<void> _uriListener(_Listen event, Emitter<CoreAppLinkState> emit) async {
    try {
      coreAppLinkRepository.uriListener((uri) {
        add(CoreAppLinkEvent.process(uri));
      });
    } catch (e) {
      emit(state.copyWith(errorListener: CoreException(message: e.toString())));
    }
  }

  Future<void> _process(_Process event, Emitter<CoreAppLinkState> emit) async {
    try {
      emit(state.copyWith(uri: event.uri));
    } catch (e) {
      emit(state.copyWith(error: CoreException(message: e.toString())));
    }
  }
}
