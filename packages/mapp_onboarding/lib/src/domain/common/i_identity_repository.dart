import 'package:dartz/dartz.dart';
import 'package:mapp_api/mapp_api.dart';

abstract class IIdentityRepository {
  Future<Either<MappException, GuestTokenResponse>> generateGuestToken();
}