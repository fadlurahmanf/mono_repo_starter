import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:km_storage/km_storage.dart';

class KmStorage extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerLazySingleton<KmSqfliteDBRepository>(() => KmSqfliteDBRepository())
      ..registerSingletonAsync<KmSqfliteStorage>(
          () async => KmSqfliteStorage(db: await c.get<KmSqfliteDBRepository>().openDB()));
  }
}
