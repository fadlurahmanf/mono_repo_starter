import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_storage/src/domain/common/i_mapp_sqflite_storage.dart';
import 'package:mapp_storage/src/domain/repository/mapp_db_creator.dart';
import 'package:mapp_storage/src/domain/repository/mapp_sqflite_storage.dart';

class MappStorage extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingletonAsync<IMappLocalDatasource>(() async => MappLocalDatasource()..init())
      ..registerLazySingleton<MappDbCreator>(() => MappDbCreator())
      ..registerSingletonAsync<IMappSqfliteStorage>(
          () async => MappSqfliteStorage(db: await c.get<MappDbCreator>().openDB()));
    await c.isReady<IMappLocalDatasource>();
  }
}
