import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_bloc.freezed.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initialize()) {
    on<LocalizationEvent>((event, emit) async {
      await event.map(
        setLanguage: (event) => _setLanguage(event, emit),
      );
    });
  }

  Future<void> _setLanguage(_SetLanguage event, Emitter<LocalizationState> emit) async {
    emit(state.copyWith(currentLocale: event.locale));
  }
}
