import 'package:freezed_annotation/freezed_annotation.dart';

part 'ctu_item_pagination_response.freezed.dart';

part 'ctu_item_pagination_response.g.dart';

@freezed
class CtuItemPaginationResponse with _$CtuItemPaginationResponse {
  const factory CtuItemPaginationResponse({
    final String? id,
    final String? status,
    final String? label,
    final String? createdAt,
  }) = _CtuItemPaginationResponse;

  factory CtuItemPaginationResponse.fromJson(Map<String, dynamic> json) => _$CtuItemPaginationResponseFromJson(json);
}
