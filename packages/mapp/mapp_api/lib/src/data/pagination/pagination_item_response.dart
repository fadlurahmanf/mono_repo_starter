import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_item_response.freezed.dart';

part 'pagination_item_response.g.dart';

@freezed
class PaginationItemResponse with _$PaginationItemResponse {
  const factory PaginationItemResponse({
    final int? id,
    @JsonKey(name: 'first_name') final String? firstName,
    final String? email,
    final String? street,
  }) = _PaginationItemResponse;

  factory PaginationItemResponse.fromJson(Map<String, dynamic> json) => _$PaginationItemResponseFromJson(json);
}
