import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

abstract class IObjectDetectorRepository {
  Future<void> processImage({
    required ObjectDetector objectDetector,
    required InputImage inputImage,
    required Function(String label, double confidence) onDetectObject,
  });

  InputImage? getInputImageFromCamera({required CameraImage image, required CameraDescription camera});
}
