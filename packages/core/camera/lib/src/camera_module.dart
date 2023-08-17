import 'package:core_camera/src/domain/repositories/camera_repository.dart';
import 'package:core_camera/src/domain/repositories/i_camera_repository.dart';
import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';

class CameraModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<ICameraRepository>(() => CameraRepository()..initAvailableCameras());

    await c.isReady<ICameraRepository>();
  }
}
