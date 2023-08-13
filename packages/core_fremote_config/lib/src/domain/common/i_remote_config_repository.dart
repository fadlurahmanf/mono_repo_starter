import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class IRemoteConfigRepository {
  String getStringByKey(String key);
  bool getBoolByKey(String key);
}