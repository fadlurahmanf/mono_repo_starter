import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/_index.dart';

class CoreMLKitModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<IFaceDetectorRepository>(() => FaceDetectorRepository());
  }
}
