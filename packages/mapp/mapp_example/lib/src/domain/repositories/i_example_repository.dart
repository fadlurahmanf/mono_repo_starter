import 'package:dartz/dartz.dart';
import 'package:mapp_api/mapp_api.dart';

abstract class IExampleRepository {
  Future<Either<Exception, ConnectionResponse>> initializeConnection();
}