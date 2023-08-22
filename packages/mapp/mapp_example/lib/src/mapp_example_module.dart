import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_example/src/_index.dart';
import 'package:mapp_example/src/presentation/crypto/salsa_screen.dart';
import 'package:mapp_example/src/presentation/locator/_index.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/manual_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/bloc/video_call_bloc.dart';
import 'package:mapp_example/src/presentation/rtc/list_room_screen.dart';
import 'package:mapp_example/src/presentation/rtc/manual_call_screen.dart';
import 'package:mapp_example/src/presentation/storage/_index.dart';
import 'package:mapp_firebase_database/mapp_firebase_database.dart';

class MappExampleModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c
      ..registerFactory<VideoCallBloc>(() => VideoCallBloc())
      ..registerFactory<ManualCallBloc>(
          () => ManualCallBloc(videoCallRemoteDataSource: c.get<IVideoCallRemoteDataSource>()));
  }
}

class MappExampleRoute extends RouteModule {
  @override
  List<AppGetPage> get pages => [
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: ExampleScreen,
          page: (context) => const ExampleScreen(),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: SwitchLanguageScreen,
          page: (context) => const SwitchLanguageScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: NotificationScreen,
          page: (context) => const NotificationScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: StorageScreen,
          page: (context) => const StorageScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: LocatorScreen,
          page: (context) => const LocatorScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: FaceDetectionScreen,
          page: (context) => const FaceDetectionScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: AesScreen,
          page: (context) => const AesScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: Ed25519Screen,
          page: (context) => const Ed25519Screen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: RsaScreen,
          page: (context) => const RsaScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: SalsaScreen,
          page: (context) => const SalsaScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: ListRoomScreen,
          page: (context) => const ListRoomScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: CallerScreen,
          page: (context) => const CallerScreen().wrap(context),
        ),
        AppGetPage(
          moduleType: MappExampleRoute,
          screenType: ManualCallScreen,
          page: (context) => const ManualCallScreen().wrap(context),
        ),
      ];
}
