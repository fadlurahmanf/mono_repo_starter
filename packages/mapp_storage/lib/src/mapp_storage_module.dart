import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_storage/src/repository/_index.dart';

class MappStorage extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<MappSqfliteDBRepository>(() => MappSqfliteDBRepository())
      ..registerSingletonAsync<MappSqfliteRepository>(
          () async => MappSqfliteRepository(db: await c.get<MappSqfliteDBRepository>().openDB()));
  }
}
