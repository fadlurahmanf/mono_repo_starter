import 'package:core_config/config.dart';
import 'package:core_face_detection/src/domain/repositories/face_detection_repository.dart';
import 'package:core_face_detection/src/domain/repositories/i_face_detection_repository.dart';
import 'package:get_it/get_it.dart';

class FaceDetectionModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<IFaceDetectionRepository>(() => FaceDetectionRepository());
  }
}
