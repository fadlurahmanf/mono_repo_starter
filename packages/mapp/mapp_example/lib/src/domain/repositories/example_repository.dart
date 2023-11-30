import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_example/src/domain/repositories/i_example_repository.dart';
import 'package:mapp_example/src/domain/repositories/i_pagination_repository.dart';

class ExampleRepository implements IExampleRepository {
  IOpenviduApi openviduApi;

  ExampleRepository({required this.openviduApi});

  @override
  Future<Either<Exception, ConnectionResponse>> initializeConnection() async {
    try {
      return right(await openviduApi.initializeConnection(sessionId: 'cool-aqua-porpoise'));
    } on Exception catch (e) {
      return left(e);
    }
  }
}
