import 'package:core_config/config.dart';
import 'package:core_mlkit/src/domain/repositories/i_image_labeling_repository.dart';
import 'package:core_mlkit/src/domain/repositories/image_labeling_repository.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/_index.dart';

class CoreMLKitModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerLazySingleton<IFaceDetectorRepository>(() => FaceDetectorRepository());
    c.registerLazySingleton<IImageLabelingRepository>(() => ImageLabelingRepository());
  }
}
