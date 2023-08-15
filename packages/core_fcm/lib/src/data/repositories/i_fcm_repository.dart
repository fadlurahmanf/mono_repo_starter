import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IFCMRepository {
  Future<String?> getToken();
  Future<RemoteMessage?> getInitialMessage();
}