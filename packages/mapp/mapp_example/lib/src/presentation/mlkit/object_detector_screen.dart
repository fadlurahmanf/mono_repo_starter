import 'package:core_camera/camera.dart';
import 'package:core_config/config.dart';
import 'package:core_mlkit/core_mlkit.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ObjectDetectorScreen extends StatefulWidget with WrapperState {
  const ObjectDetectorScreen({super.key});

  @override
  State<ObjectDetectorScreen> createState() => _ObjectDetectorScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _ObjectDetectorScreenState extends State<ObjectDetectorScreen> with WidgetsBindingObserver {
  late CameraController cameraController;
  late CameraDescription cameraDescription;
  final ImageLabeler imageLabeler = ImageLabeler(
    options: ImageLabelerOptions(),
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
        title: Text('Object Detector Screen'),
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
    final bool isHaveRearCamera = context.get<ICameraRepository>().isHaveRearCamera();
    if (!isHaveRearCamera) {
      return;
    }
    cameraDescription = context.get<ICameraRepository>().getRearCamera().first;
    cameraController = CameraController(cameraDescription, ResolutionPreset.medium);
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
      await Future.delayed(const Duration(seconds: 1), () async {
        print("MASUK IS PROCESSING: $isProcessing");
        final inputImage =
            context.get<IImageLabelingRepository>().getInputImageFromCamera(image: image, camera: cameraDescription);
        if (inputImage == null) {
          return;
        }
        await context.get<IImageLabelingRepository>().processImage(
              imageLabeler: imageLabeler,
              inputImage: inputImage,
              onDetectLabel: (label, confidence) {
                print("MASUK LABEL: $label");
                print("MASUK CONFIDENCE: $confidence");
                setState(() {
                  result = 'LABEL: $label\nCONFIDENCE: $confidence';
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
