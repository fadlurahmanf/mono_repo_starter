import 'package:core/core.dart';
import 'package:core_notification/src/domain/common/_index.dart';
import 'package:core_notification/src/domain/repository/_index.dart';
import 'package:get_it/get_it.dart';

class CoreNotificationModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    // c.registerLazySingleton<INotificationRepository>(() => NotificationRepository());
  }
}
