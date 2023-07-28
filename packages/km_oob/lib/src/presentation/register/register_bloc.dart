import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:km_validator/km_validator.dart';

part 'register_bloc.freezed.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initialize()) {
    on<RegisterEvent>((events, emit) async {
      await events.map(
          fillFullName: (event) async => await _fillFullName(event, emit),
          fillEmail: (event) async => await _fillEmail(event, emit),
          fillPassword: (event) async => await _fillPassword(event, emit),
          fillConfPassword: (event) async => await _fillConfPassword(event, emit));
    });
  }

  Future<void> _fillFullName(_FillFullName event, emit) async {
    emit(state.copyWith(fullName: event.fullName, eFullName: KmNameValidator.validateName(event.fullName)));
  }

  Future<void> _fillEmail(_FillEmail event, emit) async {
    emit(state.copyWith(email: event.email, eFullName: KmEmailValidator.validateEmail(event.email)));
  }

  Future<void> _fillPassword(_FillPassword event, emit) async {
    emit(state.copyWith(password: event.password, ePassword: KmPasswordValidator.validatePassword(event.password)));
    if (state.confPassword != null) {
      emit(state.copyWith(
          confPassword: state.confPassword ?? '',
          ePassword: KmPasswordValidator.validateConfPassword(
              password: event.password, confPassword: state.confPassword ?? '')));
    }
  }

  Future<void> _fillConfPassword(_FillConfPassowrd event, emit) async {
    emit(state.copyWith(
        confPassword: event.password,
        ePassword:
            KmPasswordValidator.validateConfPassword(password: state.password ?? '', confPassword: event.password)));
    if (state.password != null) {
      emit(state.copyWith(
          password: state.password,
          ePassword: KmPasswordValidator.validatePassword(
            state.password ?? '',
          )));
    }
  }
}
