part of 'loading_bloc.dart';

@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState({
    bool? showLoadingInAWhile
}) = _LoadingState;

  factory LoadingState.initialize() => const LoadingState();
}