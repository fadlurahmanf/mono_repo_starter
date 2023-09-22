import 'package:mapp_api/src/data/identity/guest_token_request.dart';
import 'package:mapp_api/src/data/identity/guest_token_response.dart';
import 'package:mapp_api/src/domain/common/i_identity_api.dart';
import 'package:dio/dio.dart';
import 'package:mapp_api/src/external/helper.dart';

class IdentityApi implements IIdentityApi {
  final Dio dio;

  IdentityApi({required this.dio});

  static const String generateGuestTokenPath = 'guest/session/create';

  @override
  Future<GuestTokenResponse> generateGuestToken(GuestTokenRequest request) async {
    return handleResponse<GuestTokenResponse>(
      onRequest: () async => await dio.post(generateGuestTokenPath, data: request.toJson()),
      onResponseMap: (map) => GuestTokenResponse.fromJson(map),
    );
  }
}
