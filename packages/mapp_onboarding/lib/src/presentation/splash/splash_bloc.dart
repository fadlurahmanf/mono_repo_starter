import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_onboarding/src/domain/common/i_identity_repository.dart';

part 'splash_bloc.freezed.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  IIdentityRepository identityRepository;

  SplashBloc({required this.identityRepository}) : super(SplashState.initialize()) {
    on<SplashEvent>((events, emit) async {
      await events.map(generateGuestToken: (event) async => await _generateGuestToken(event, emit));
    });
  }

  Future<void> _generateGuestToken(_GenerateGuestToken event, Emitter<SplashState> emit) async {
    try {
      final res = await identityRepository.generateGuestToken();
      res.fold(
        (l) => emit(state.copyWith(generateGuestTokenState: GenerateGuestTokenFailed(exception: l))),
        (r) => emit(state.copyWith(generateGuestTokenState: GenerateGuestTokenSuccess())),
      );
    } on MappException catch (e) {
      emit(state.copyWith(generateGuestTokenState: GenerateGuestTokenFailed(exception: e)));
    } on Exception catch (e) {
      emit(state.copyWith(generateGuestTokenState: GenerateGuestTokenFailed(exception: MappException.fromError(e))));
    }
  }
}
