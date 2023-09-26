import 'package:core_camera/camera.dart';
import 'package:core_config/config.dart';
import 'package:core_mlkit/core_mlkit.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:core_ui/ui.dart';

class FaceDetectorScreen extends StatefulWidget with WrapperState {
  const FaceDetectorScreen({super.key});

  @override
  State<FaceDetectorScreen> createState() => _FaceDetectorScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _FaceDetectorScreenState extends State<FaceDetectorScreen> with WidgetsBindingObserver {
  late CameraController cameraController;
  late CameraDescription cameraDescription;
  final FaceDetector faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );

  @override
  void initState() {
    super.initState();
    initCamera(context);
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  String result = 'RESULT: ??';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detection Screen'),
      ),
      body: cameraController.value.isInitialized == true ? _layoutCamera(context) : Container(),
    );
  }

  Widget _layoutCamera(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: 100,
              child: CameraPreview(cameraController),
            ),
          ),
        ),
        const FaceOverlay(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 200),
            padding: EdgeInsets.all(10),
            child: Text(
              result,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Future<void> initCamera(BuildContext context) async {
    final bool isHaveFrontCamera = context.get<ICameraRepository>().isHaveFrontCamera();
    if (!isHaveFrontCamera) {
      return;
    }
    cameraDescription = context.get<ICameraRepository>().getFrontCamera().first;
    cameraController = CameraController(cameraDescription, ResolutionPreset.low);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
      cameraController.startImageStream((image) async => await processImage(context, image: image));
    });
  }

  bool isProcessing = false;

  Future<void> processImage(BuildContext context, {required CameraImage image}) async {
    try {
      if (isProcessing) {
        return;
      }
      isProcessing = true;
      await Future.delayed(const Duration(seconds: 3), () async {
        final inputImage =
            context.get<IFaceDetectorRepository>().getInputImageFromCamera(image: image, camera: cameraDescription);
        if (inputImage == null) {
          return;
        }
        await context.get<IFaceDetectorRepository>().processImage(
              faceDetector: faceDetector,
              inputImage: inputImage,
              onDetectedFace: (smile, left, right) {
                debugPrint("MASUK SMILE: $smile");
                debugPrint("MASUK LEFT EYE: $left");
                debugPrint("MASUK RIGHT EYE: $right");
                setState(() {
                  result =
                      'RIGHT EYE OPEN PROBABILITY: $right\nLEFT EYE OPEN PROBABILITY: $left\nSMILING PROBABILITY: $smile';
                });
              },
            );
        isProcessing = false;
      });
    } catch (e) {
      isProcessing = false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      cameraController.stopImageStream().then((value) {
        cameraController.dispose();
      });
    } else if (state == AppLifecycleState.resumed) {
      if (mounted) {
        initCamera(context);
      }
    }
  }
}
