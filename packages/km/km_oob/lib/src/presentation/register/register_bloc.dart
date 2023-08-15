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
        fillConfPassword: (event) async => await _fillConfPassword(event, emit),
        register: (event) async => await _register(event, emit),
      );
    });
  }

  Future<void> _fillFullName(_FillFullName event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(fullName: event.fullName, eFullName: KmNameValidator.validateName(event.fullName)));
  }

  Future<void> _fillEmail(_FillEmail event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(email: event.email, eEmail: KmEmailValidator.validateEmail(event.email)));
  }

  Future<void> _fillPassword(_FillPassword event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(password: event.password, ePassword: KmPasswordValidator.validatePassword(event.password)));
    if (state.confPassword != null) {
      emit(state.copyWith(
          confPassword: state.confPassword ?? '',
          eConfPassword: KmPasswordValidator.validateConfPassword(
              password: event.password, confPassword: state.confPassword ?? '')));
    }
  }

  Future<void> _fillConfPassword(_FillConfPassowrd event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        confPassword: event.password,
        eConfPassword:
            KmPasswordValidator.validateConfPassword(password: state.password ?? '', confPassword: event.password)));
    if (state.password != null) {
      emit(state.copyWith(
          password: state.password,
          ePassword: KmPasswordValidator.validatePassword(
            state.password ?? '',
          )));
    }
  }

  Future<void> _register(_Register event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
      eFullName: KmNameValidator.validateName(state.fullName ?? ''),
      eEmail: KmEmailValidator.validateEmail(state.email ?? ''),
      ePassword: KmPasswordValidator.validatePassword(state.password ?? ''),
      eConfPassword: KmPasswordValidator.validateConfPassword(
          password: state.password ?? '', confPassword: state.confPassword ?? ''),
    ));
    if (state.eFullName != null || state.eEmail != null || state.ePassword != null || state.eConfPassword != null) {
      return;
    }
    emit(state.copyWith(postingRegisterState: PostingRegisterLoading()));
    await Future.delayed(const Duration(seconds: 10));
    emit(state.copyWith(postingRegisterState: PostingRegisterSuccess()));
    emit(state.copyWith(postingRegisterState: PostingRegisterIdle()));
  }
}
