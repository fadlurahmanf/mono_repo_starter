import 'package:dartz/dartz.dart';
import 'package:mapp_onboarding/src/domain/common/i_identity_repository.dart';
import 'package:mapp_api/mapp_api.dart';

class IdentityRepository implements IIdentityRepository {
  IIdentityApi identityApi;

  IdentityRepository({required this.identityApi});

  @override
  Future<Either<MappException, GuestTokenResponse>> generateGuestToken() async {
    try {
      final response = await identityApi.generateGuestToken(const GuestTokenRequest(
        guestId: 'Random Guest Id',
      ));
      return right(response);
    } on MappException catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(MappException.fromError(e));
    }
  }
}
