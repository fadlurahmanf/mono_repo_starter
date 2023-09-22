import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:km_shared/km_shared.dart';

class KmShared extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<KmConstant>(() => KmConstant());
  }
}
