import 'package:dartz/dartz.dart';
import 'package:mapp_onboarding/src/domain/common/i_identity_repository.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_storage/mapp_storage.dart';

class IdentityRepository implements IIdentityRepository {
  IIdentityApi identityApi;
  IMappSqfliteStorage mappSqfliteStorage;

  IdentityRepository({required this.identityApi, required this.mappSqfliteStorage});

  @override
  Future<Either<MappException, GuestTokenResponse>> generateGuestToken() async {
    try {
      final response = await identityApi.generateGuestToken(const GuestTokenRequest(
        guestId: 'Random Guest Id',
      ));
      if (response.accessToken != null) {
        await mappSqfliteStorage.updateGuestToken(response.accessToken ?? '');
      } else {
        throw MappException(message: 'ACCESS_TOKEN_MISSING');
      }
      return right(response);
    } on MappException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(MappException.fromError(e));
    }
  }
}
