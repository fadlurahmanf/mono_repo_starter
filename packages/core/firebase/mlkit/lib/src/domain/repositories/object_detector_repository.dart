import 'dart:io';

import 'package:core_mlkit/src/domain/repositories/i_object_detector_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

class ObjectDetectorRepository implements IObjectDetectorRepository {
  @override
  Future<void> processImage({
    required ObjectDetector objectDetector,
    required InputImage inputImage,
    required Function(String label, double confidence) onDetectObject,
  }) async {
    print("MASUK PROCESS IMAGE");
    final objects = await objectDetector.processImage(inputImage);
    print("MASUK OBJECTS: ${objects.length}");
    for (var element in objects) {
      print("MASUK ELEMENT: ${element.labels.length}");
      print("MASUK TOP: ${element.boundingBox.top}");
      print("MASUK LEFT: ${element.boundingBox.left}");
      print("MASUK RIGHT: ${element.boundingBox.right}");
      for (var label in element.labels) {
        print("MASUK LABEL: ${label.text} & CONFIDENCE: ${label.confidence}");
        onDetectObject(label.text, label.confidence);
      }
    }
  }

  @override
  InputImage? getInputImageFromCamera({required CameraImage image, required CameraDescription camera}) {
    InputImageRotation? inputImageRotation;
    if (Platform.isIOS) {
      inputImageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    } else if (Platform.isAndroid) {
      inputImageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);

      // check later on android
      // var rotationCompensation = _orientations[_controller!.value.deviceOrientation];
      // if (rotationCompensation == null) return null;
      // if (camera.lensDirection == CameraLensDirection.front) {
      //   // front-facing
      //   rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      // } else {
      //   // back-facing
      //   rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
      // }
      // rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    } else {
      throw UnimplementedError();
    }

    if (inputImageRotation == null) {
      return null;
    }

    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: inputImageRotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}
