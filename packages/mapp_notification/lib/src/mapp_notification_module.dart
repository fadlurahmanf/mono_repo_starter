import 'package:core_notification/core_notification.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_notification/src/_index.dart';

class MappNotificationModule extends CoreNotificationModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    super.registerDependency(c);
    c.registerLazySingleton<IMappNotificationRepository>(() => MappNotificationRepository());
  }
}