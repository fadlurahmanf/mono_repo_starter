import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_request.freezed.dart';

part 'connection_request.g.dart';

@freezed
class ConnectionRequest with _$ConnectionRequest {
  const factory ConnectionRequest({
    required String type,
    required bool record,
    required String role,
  }) = _ConnectionRequest;

  factory ConnectionRequest.fromJson(Map<String, dynamic> json) => _$ConnectionRequestFromJson(json);
}
