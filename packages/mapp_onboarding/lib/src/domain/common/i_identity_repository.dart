import 'package:dartz/dartz.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_shared/mapp_shared.dart';

abstract class IIdentityRepository {
  Future<Either<MappResponseException, GuestTokenResponse>> generateGuestToken();
}