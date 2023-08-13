import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_token_response.freezed.dart';

part 'guest_token_response.g.dart';

@freezed
class GuestTokenResponse with _$GuestTokenResponse {
  const factory GuestTokenResponse({
    String? accessToken,
    int? expiresIn
  }) = _GuestTokenResponse;

  factory GuestTokenResponse.fromJson(Map<String, dynamic> json) => _$GuestTokenResponseFromJson(json);
}
