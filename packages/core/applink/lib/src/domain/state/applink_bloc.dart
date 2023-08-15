import 'package:core_config/config.dart';
import 'package:core_applink/src/domain/common/i_applink_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'applink_bloc.freezed.dart';

part 'applink_event.dart';

part 'applink_state.dart';

class AppLinkBloc extends Bloc<AppLinkEvent, AppLinkState> {
  IAppLinkRepository appLinkRepository;

  AppLinkBloc({required this.appLinkRepository}) : super(AppLinkState.initialize()) {
    on<AppLinkEvent>((events, emit) async {
      await events.map(
          init: (event) async => await _init(event, emit),
          listen: (event) async => await _uriListener(event, emit),
          process: (event) async => await _process(event, emit),
          remove: (event) async => await _remove(event, emit));
    });
  }

  Future<void> _uriListener(_Listen event, Emitter<AppLinkState> emit) async {
    appLinkRepository.uriListener((uri) {
      Future.delayed(const Duration(seconds: 2), () {
        add(AppLinkEvent.process(uri));
      });
    });
  }

  Future<void> _process(_Process event, Emitter<AppLinkState> emit) async {
    emit(state.copyWith(uri: event.uri));
    await Future.delayed(const Duration(seconds: 2), () {
      add(const AppLinkEvent.remove());
    });
  }

  Future<void> _init(_Init event, Emitter<AppLinkState> emit) async {
    final uri = await appLinkRepository.appLinks.getInitialAppLink();
    if (uri != null) {
      add(AppLinkEvent.process(uri));
    }
  }

  Future<void> _remove(_Remove event, Emitter<AppLinkState> emit) async {
    emit(state.copyWith(uri: null));
  }
}
