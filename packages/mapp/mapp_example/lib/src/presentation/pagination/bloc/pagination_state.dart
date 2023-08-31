part of 'pagination_bloc.dart';

@freezed
class PaginationState with _$PaginationState {
  const factory PaginationState({
    required int offset,
    LoadPaginationState? loadPaginationState,
  }) = _PaginationState;

  factory PaginationState.initialize() => const PaginationState(offset: 900);
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
