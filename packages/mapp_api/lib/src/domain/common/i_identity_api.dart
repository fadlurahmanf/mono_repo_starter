import 'package:mapp_api/src/data/general/mapp_base_response.dart';
import 'package:mapp_api/src/data/general/mapp_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:mapp_api/src/data/identity/guest_token_request.dart';
import 'package:mapp_api/src/data/identity/guest_token_response.dart';

abstract class IIdentityApi {
  Future<GuestTokenResponse> generateGuestToken(GuestTokenRequest request);
}
