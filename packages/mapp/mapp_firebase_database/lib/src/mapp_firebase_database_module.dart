import 'package:core_config/config.dart';
import 'package:get_it/get_it.dart';
import 'package:mapp_firebase_database/src/data/datasources/i_videocall_remote_datasource.dart';
import 'package:mapp_firebase_database/src/data/datasources/videocall_remote_datasource.dart';

class MappFirebaseDatabaseModule extends BaseModule {
  @override
  Future<void> registerDependency(GetIt c) async {
    c.registerFactory<IVideoCallRemoteDataSource>(() => VideoCallRemoteDataSource());
  }
}
