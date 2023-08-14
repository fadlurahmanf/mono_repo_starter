import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/common/i_mapp_repository.dart';

part 'mapp_bloc.freezed.dart';

part 'mapp_event.dart';

part 'mapp_state.dart';

class MappBloc extends Bloc<MappEvent, MappState> {
  IMappRepository mappRepository;
  AppLogger appLogger;

  MappBloc({required this.mappRepository, required this.appLogger}) : super(MappState.initialize()) {
    on<MappEvent>((events, emit) async {
      await events.map(
        init: (event) async => await _init(event, emit),
        saveLocale: (event) async => await _saveLocale(event, emit),
      );
    });
  }

  Future<void> _init(_Init event, Emitter<MappState> emit) async {
    await mappRepository.setupStorageFirstInstall(event.deviceId, locale: event.locale);
  }

  Future<void> _saveLocale(_SaveLocale event, Emitter<MappState> emit) async {
    await mappRepository.saveLocale(event.locale);
  }
}
