import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pagination_response.freezed.dart';

part 'base_pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BasePaginationResponse<T> with _$BasePaginationResponse<T> {
  const factory BasePaginationResponse({
    @JsonKey(name: 'total_users') final int? totalUsers,
    final int? offset,
    final int? limit,
    @JsonKey(name: 'users') T? datas,
  }) = _BasePaginationResponse;

  factory BasePaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BasePaginationResponseFromJson(json, fromJsonT);
}
