import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/common/i_mapp_repository.dart';

part 'mapp_bloc.freezed.dart';

part 'mapp_event.dart';

part 'mapp_state.dart';

class MappBloc extends Bloc<MappEvent, MappState> {
  IMappRepository mappRepository;

  MappBloc({required this.mappRepository}) : super(MappState.initialize()) {
    on<MappEvent>((events, emit) async {
      await events.map(
        saveLocale: (event) async => _saveLocale(event, emit),
        saveDeviceId: (event) async => _saveDeviceId(event, emit),
      );
    });
  }

  Future<void> _saveLocale(_SaveLocale event, Emitter<MappState> emit) async {}

  Future<void> _saveDeviceId(_SaveDeviceId event, Emitter<MappState> emit) async {
    try {
      await mappRepository.saveOrUpdateDeviceId(event.deviceId);
    } on Exception catch (e) {}
  }
}
