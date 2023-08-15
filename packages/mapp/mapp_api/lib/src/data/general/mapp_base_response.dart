import 'package:freezed_annotation/freezed_annotation.dart';

part 'mapp_base_response.g.dart';
part 'mapp_base_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class MappBaseResponse<T> with _$MappBaseResponse<T> {
  const factory MappBaseResponse({
    final bool? status,
    final String? code,
    final String? message,
    final T? data,
  }) = _MappBaseResponse;

  factory MappBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$MappBaseResponseFromJson<T>(json, fromJsonT);
}
