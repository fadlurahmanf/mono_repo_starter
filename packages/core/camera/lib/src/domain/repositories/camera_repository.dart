import 'package:camera/camera.dart';
import 'package:core_camera/src/domain/repositories/i_camera_repository.dart';
import 'package:get/get.dart';

class CameraRepository implements ICameraRepository {
  late List<CameraDescription> allCameras;

  @override
  List<CameraDescription> get cameras => allCameras;

  @override
  Future<void> initAvailableCameras() async {
    allCameras = await availableCameras();
  }

  @override
  bool isHaveCamera() {
    return allCameras.isNotEmpty;
  }

  @override
  bool isHaveRearCamera() {
    return allCameras.firstWhereOrNull((element) => element.lensDirection == CameraLensDirection.back) != null;
  }

  @override
  bool isHaveFrontCamera() {
    return allCameras.firstWhereOrNull((element) => element.lensDirection == CameraLensDirection.front) != null;
  }

  @override
  List<CameraDescription> getRearCamera() {
    return allCameras.where((element) => element.lensDirection == CameraLensDirection.back).toList();
  }

  @override
  List<CameraDescription> getFrontCamera() {
    return allCameras.where((element) => element.lensDirection == CameraLensDirection.front).toList();
  }
}
