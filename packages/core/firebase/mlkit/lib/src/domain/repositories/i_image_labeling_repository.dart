import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

abstract class IImageLabelingRepository {
  Future<void> processImage({
    required ImageLabeler imageLabeler,
    required InputImage inputImage,
    required Function(String label, double confidence) onDetectLabel,
  });

  InputImage? getInputImageFromCamera({required CameraImage image, required CameraDescription camera});
}
