import 'package:mapp_api/src/data/identity/guest_token_request.dart';
import 'package:mapp_api/src/data/identity/guest_token_response.dart';

abstract class IIdentityApi {
  Future<GuestTokenResponse> generateGuestToken(GuestTokenRequest request);
}
