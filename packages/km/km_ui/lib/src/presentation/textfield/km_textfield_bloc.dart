import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'km_textfield_bloc.freezed.dart';

part 'km_textfield_event.dart';

part 'km_textfield_state.dart';

class KmTextFieldBloc extends Bloc<KmTextFieldEvent, KmTextFieldState> {
  KmTextFieldBloc() : super(KmTextFieldState.initialize()) {
    on<KmTextFieldEvent>((events, emit) async {
      await events.mapOrNull(
          typing: (event) async => await _typing(event, emit), setError: (event) async => await _setError(event, emit));
    });
  }

  Future<void> _typing(_Typing event, Emitter<KmTextFieldState> emit) async {
    emit(state.copyWith(showLabel: true, text: event.text));
  }

  Future<void> _setError(_SetError event, Emitter<KmTextFieldState> emit) async {
    emit(state.copyWith(error: event.error));
  }
}
