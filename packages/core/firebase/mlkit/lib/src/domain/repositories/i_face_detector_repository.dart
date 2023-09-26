import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';

abstract class IFaceDetectorRepository {
  Future<void> processImage({
    required FaceDetector faceDetector,
    required InputImage inputImage,
    required Function(double? smilingProbability, double? leftEyeOpenProbability, double? rightEyeOpenProbability)
        onDetectedFace,
  });

  InputImage? getInputImageFromCamera({required CameraImage image, required CameraDescription camera});
}
