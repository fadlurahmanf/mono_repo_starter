import 'package:dartz/dartz.dart';
import 'package:mapp_onboarding/src/domain/common/i_identity_repository.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';

class IdentityRepository implements IIdentityRepository {
  IIdentityApi identityApi;
  IMappSqfliteStorage mappSqfliteStorage;

  IdentityRepository({required this.identityApi, required this.mappSqfliteStorage});

  @override
  Future<Either<MappResponseException, GuestTokenResponse>> generateGuestToken() async {
    try {
      final response = await identityApi.generateGuestToken(const GuestTokenRequest(
        guestId: 'Random Guest Id',
      ));
      if (response.accessToken != null) {
        await mappSqfliteStorage.updateGuestToken(response.accessToken ?? '');
      } else {
        throw MappResponseException(message: 'ACCESS_TOKEN_MISSING');
      }
      return right(response);
    } on MappResponseException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(MappResponseException.fromException(e));
    }
  }
}
