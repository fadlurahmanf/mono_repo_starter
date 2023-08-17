import 'package:camera/camera.dart';

abstract class ICameraRepository {
  Future<void> initAvailableCameras();

  List<CameraDescription> get cameras;

  bool isHaveCamera();

  bool isHaveRearCamera();

  bool isHaveFrontCamera();

  List<CameraDescription> getRearCamera();

  List<CameraDescription> getFrontCamera();
}
