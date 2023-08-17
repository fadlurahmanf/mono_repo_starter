import 'dart:io';

import 'package:core_face_detection/src/domain/repositories/i_face_detection_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

class FaceDetectionRepository implements IFaceDetectionRepository {
  @override
  Future<void> processImage({
    required FaceDetector faceDetector,
    required InputImage inputImage,
    required Function(double? smilingProbability, double? leftEyeOpenProbability, double? rightEyeOpenProbability)
        onDetectedFace,
  }) async {
    final faces = await faceDetector.processImage(inputImage);
    for (var element in faces) {
      onDetectedFace(element.smilingProbability, element.leftEyeOpenProbability, element.rightEyeOpenProbability);
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
