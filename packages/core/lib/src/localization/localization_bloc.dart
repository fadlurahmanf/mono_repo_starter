import 'package:core/src/dto/entity/core_entity.dart';
import 'package:core/src/storage/core_sqflite_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_bloc.freezed.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  CoreSqfliteStorage coreStorage;

  LocalizationBloc({required this.coreStorage}) : super(LocalizationState.initialize()) {
    on<LocalizationEvent>((event, emit) async {
      await event.map(
        initAppLanguage: (event) => _initAppLanguage(event, emit),
        setLanguage: (event) => _setLanguage(event, emit),
      );
    });
  }

  Future<void> _initAppLanguage(_InitAppLanguage event, Emitter<LocalizationState> emit) async {
    final first = await coreStorage.getFirstEntity();
    if (first != null) {
      emit(state.copyWith(currentLocale: event.defaultLocale));
    } else {
      if (event.defaultLocale != null) {
        await coreStorage.insertOrUpdateIfExist(
            CoreEntity(languageCode: event.defaultLocale?.languageCode, countryCode: event.defaultLocale?.countryCode));
        emit(state.copyWith(currentLocale: event.defaultLocale));
      }
    }
  }

  Future<void> _setLanguage(_SetLanguage event, Emitter<LocalizationState> emit) async {
    final first = await coreStorage.getFirstEntity();
    if (first != null) {
      await coreStorage.insertOrUpdateIfExist(
          first.copyWith(languageCode: event.locale.languageCode, countryCode: event.locale.countryCode));
    } else {
      await coreStorage.insertOrUpdateIfExist(
          CoreEntity(languageCode: event.locale.languageCode, countryCode: event.locale.countryCode));
    }
    emit(state.copyWith(currentLocale: event.locale));
  }
}
