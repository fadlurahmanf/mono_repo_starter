import 'package:freezed_annotation/freezed_annotation.dart';

part 'ctu_base_pagination_response.freezed.dart';

part 'ctu_base_pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class CtuBasePaginationResponse<T> with _$CtuBasePaginationResponse<T> {
  const factory CtuBasePaginationResponse({
    final int? totalPages,
    final int? totalItems,
    final bool? next,
    final T? content,
  }) = _CtuBasePaginationResponse;

  factory CtuBasePaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$CtuBasePaginationResponseFromJson(json, fromJsonT);
}
