import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_example/src/data/dto/model/group_items.dart';
import 'package:mapp_example/src/domain/repositories/i_pagination_repository.dart';
import 'package:get/get.dart';
import 'package:mapp_shared/mapp_shared.dart';

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
        ctuFetchData: (event) async => await _onCtuFetchData(event, emit),
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

  Future<void> _onCtuFetchData(_CtuFetchData event, Emitter<PaginationState> emit) async {
    try {
      emit(state.copyWith(ctuLoadPaginationState: CtuLoadPaginationState.loading, isFirstTime: state.ctuOffset == 0));
      final offset = state.ctuOffset;
      final res = await paginationRepository.ctuGetPagination(offset: offset);
      res.fold(
          (l) => emit(
                state.copyWith(
                    ctuLoadPaginationState: CtuLoadPaginationState.failed, isFirstTime: state.ctuOffset == 0),
              ), (r) {
        final isLastPage = (r.next ?? false) == false;
        final nextOffset = isLastPage ? state.ctuOffset : state.ctuOffset + 1;
        var currentGrouped = state.grouped.toList();
        r.content?.forEach((element) {
          final key = DateTime.tryParse(element.createdAt ?? "")?.format1();
          if (currentGrouped.firstWhereOrNull((element2) => key == element2.key) != null) {
            final group = currentGrouped.firstWhere((element2) => key == element2.key);
            group.items.add(element);
          } else {
            currentGrouped.add(GroupedItems(key: key ?? "-", items: [element]));
          }
        });
        emit(state.copyWith(
          ctuLoadPaginationState: CtuLoadPaginationState.success,
          isFirstTime: state.ctuOffset == 0,
          isLastPage: isLastPage,
          ctuOffset: nextOffset,
          grouped: currentGrouped,
        ));
      });
    } on Exception catch (e) {
      emit(state.copyWith(ctuLoadPaginationState: CtuLoadPaginationState.failed, isFirstTime: state.ctuOffset == 0));
    }
  }
}
