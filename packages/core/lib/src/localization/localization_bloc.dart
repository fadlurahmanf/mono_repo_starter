import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_bloc.freezed.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initialize()) {
    on<LocalizationEvent>((event, emit) async {
      await event.map(
        changeLanguage: (event) => _changeLanguage(event, emit),
        initAppLanguage: (event) => _initAppLanguage(event, emit),
      );
    });
  }

  Future<void> _initAppLanguage(_InitAppLanguage event, Emitter<LocalizationState> emit) async {

  }

  Future<void> _changeLanguage(_ChangeLanguage event, Emitter<LocalizationState> emit) async {
    emit(state.copyWith(changeLanguageState: ChangeLanguageIdle()));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(changeLanguageState: ChangeLanguageLoading()));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(changeLanguageState: ChangeLanguageSuccess()));
  }
}
