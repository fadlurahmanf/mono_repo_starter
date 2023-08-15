import 'package:core_fcm/src/data/repositories/i_fcm_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCMRepository implements IFCMRepository {
  final _instance = FirebaseMessaging.instance;

  @override
  Future<String?> getToken() {
    return _instance.getToken();
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return _instance.getInitialMessage();
  }
}
