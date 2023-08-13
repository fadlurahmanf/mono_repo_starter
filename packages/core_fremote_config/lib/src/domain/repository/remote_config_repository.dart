import 'package:core_fremote_config/src/domain/common/i_remote_config_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository implements IRemoteConfigRepository {
  final _instance = FirebaseRemoteConfig.instance;

  @override
  String getStringByKey(String key) {
    return _instance.getString(key);
  }

  @override
  bool getBoolByKey(String key) {
    return _instance.getBool(key);
  }
}
