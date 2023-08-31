import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_example/src/domain/repositories/i_pagination_repository.dart';
import 'package:get/get.dart';

part 'pagination_bloc.freezed.dart';

part 'pagination_event.dart';

part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  IPaginationRepository paginationRepository;

  PaginationBloc({
    required this.paginationRepository,
  }) : super(PaginationState.initialize()) {
    on<PaginationEvent>((events, emit) async {
      await events.map(
        fetchData: (event) async => await _onFetchData(event, emit),
      );
    });
  }

  Future<void> _onFetchData(_FetchData event, Emitter<PaginationState> emit) async {
    try {
      emit(state.copyWith(loadPaginationState: LoadPaginationLoading()));
      final offset = state.offset;
      final res = await paginationRepository.getUsers(offset: offset, limit: 10);
      res.fold((l) => emit(state.copyWith(loadPaginationState: LoadPaginationFailed())), (r) {
        final isLastPage = (r.datas ?? []).isEmpty;
        final nextOffset = isLastPage ? state.offset : state.offset + 10;
        emit(state.copyWith(
            loadPaginationState: LoadPaginationSuccess(
              isLastPage: isLastPage,
              items: r.datas ?? [],
              nextOffset: nextOffset,
            ),
            offset: nextOffset));
      });
    } on Exception catch (e) {
      emit(state.copyWith(loadPaginationState: LoadPaginationFailed()));
    }
  }
}
