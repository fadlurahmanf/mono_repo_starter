import 'package:core_camera/camera.dart';
import 'package:core_config/config.dart';
import 'package:core_encrypt/encrypt.dart';
import 'package:core_face_detection/face_detection.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_fcm/mapp_fcm.dart';
import 'package:mapp_onboarding/mapp_onboarding.dart';
import 'package:mapp_shared/mapp_shared.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_config/mapp_config.dart';
import 'package:core_applink/applink.dart';
import 'package:mapp_example/mapp_example.dart';
import 'package:core_locator/locator.dart';

final _devRouteModules = <RouteModule>[
  MappConfigRoute(),
  MappOnBoardingRoute(),
  MappExampleRoute(),
];

final _devModules = <BaseModule>[
  AppLinkModule(),
  EncryptModule(),
  LocatorModule(),
  MappFirebaseModule(),
  MappFCMModule(),
  CameraModule(),
  FaceDetectionModule(),
  MappDevConfigModule(),
  MappDevLocalizationModule(),
  MappShared(),
  MappStorage(),
  MappApiDevModule(
    settings: MappApiDevSettings(),
  ),
  MappConfigModule(),
  MappOnBoarding(),
  MappExampleModule(),
];

final devSetting = AppRunnerSetting(
  c: GetIt.I,
  childModules: _devModules,
  routeModules: _devRouteModules,
  app: const MappApp(),
);
