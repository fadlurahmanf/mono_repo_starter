import 'package:firebase_database/firebase_database.dart';

abstract class IVideoCallRemoteDataSource {
  // on key video call
  DatabaseReference get videoCallReference;
  Stream<DatabaseEvent> get onkCallerValue;
  Stream<DatabaseEvent> get onkReceiverValue;
}