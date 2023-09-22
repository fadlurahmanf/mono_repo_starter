part of 'pagination_bloc.dart';

@freezed
class PaginationState with _$PaginationState {
  const factory PaginationState({
    required int offset,
    LoadPaginationState? loadPaginationState,

    required List<GroupedItems<CtuItemPaginationResponse>> grouped,
    required int ctuOffset,
    bool? isLastPage,
    bool? isFirstTime,
    CtuLoadPaginationState? ctuLoadPaginationState,
  }) = _PaginationState;

  factory PaginationState.initialize() => const PaginationState(offset: 900, ctuOffset: 0, grouped: []);
}

abstract class LoadPaginationState {}

class LoadPaginationIdle extends LoadPaginationState {}

class LoadPaginationLoading extends LoadPaginationState {}

class LoadPaginationSuccess extends LoadPaginationState {
  bool isLastPage;
  List<PaginationItemResponse> items;
  int nextOffset;

  LoadPaginationSuccess({required this.isLastPage, required this.items, required this.nextOffset});
}

class LoadPaginationFailed extends LoadPaginationState {}

enum CtuLoadPaginationState {
  idle, success, loading, failed
}
