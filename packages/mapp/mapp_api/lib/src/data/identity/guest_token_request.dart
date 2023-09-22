import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_token_request.freezed.dart';

part 'guest_token_request.g.dart';

@freezed
class GuestTokenRequest with _$GuestTokenRequest {
  const factory GuestTokenRequest({
    required String guestId,
  }) = _GuestTokenRequest;

  factory GuestTokenRequest.fromJson(Map<String, dynamic> json) => _$GuestTokenRequestFromJson(json);
}
