import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_response.freezed.dart';

part 'connection_response.g.dart';

@freezed
class ConnectionResponse with _$ConnectionResponse {
  const factory ConnectionResponse({
    String? id,
    String? status,
    String? sessionId,
    String? token,
  }) = _ConnectionResponse;

  factory ConnectionResponse.fromJson(Map<String, dynamic> json) => _$ConnectionResponseFromJson(json);
}
