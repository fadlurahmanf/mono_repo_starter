import 'dart:io';

import 'package:core_mlkit/core_mlkit.dart';
import 'package:core_mlkit/src/domain/repositories/i_object_detector_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class ObjectDetectorRepository implements IObjectDetectorRepository {
  @override
  Future<void> processImage({
    required ObjectDetector objectDetector,
    required InputImage inputImage,
    required Function(String label, double confidence) onDetectLabel,
  }) async {
    final objects = await objectDetector.processImage(inputImage);
    print("MASUK OBJECT LENGTH: ${objects.length}");
    for (var object in objects) {
      print("MASUK OBJECT: ${object.labels.length}");
      for (var label in object.labels) {
        onDetectLabel(label.text, label.confidence);
      }
    }
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  @override
  InputImage? getInputImageFromCamera({
    required CameraImage image,
    required CameraDescription camera,
    required DeviceOrientation deviceOrientation,
  }) {
    InputImageRotation? inputImageRotation;
    if (Platform.isIOS) {
      inputImageRotation = InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    } else if (Platform.isAndroid) {
      // check later on android
      var rotationCompensation = _orientations[deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (camera.sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation = (camera.sensorOrientation - rotationCompensation + 360) % 360;
      }
      inputImageRotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    } else {
      throw UnimplementedError();
    }

    print("MASUK INPUT IMAGE ROTATION: ${inputImageRotation != null}");
    if (inputImageRotation == null) {
      return null;
    }

    print("MASUK FORMAT RAW: ${image.format.raw}");

    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    print("MASUK FORMAT: ${format != null}");
    print("MASUK FORMAT: ${format}");

    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    print("MASUK IMAGE PLANES LENGTH: ${image.planes.length}");
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
