import 'package:firebase_database/firebase_database.dart';

abstract class IVideoCallRemoteDataSource {
  // on key video call
  DatabaseReference get videoCallRef;

  DatabaseReference get callerDb;

  DatabaseReference get videoCallRoomRef;

  Stream<DatabaseEvent> get onKCallerChildChanged;

  Stream<DatabaseEvent> get onKReceiverChildAdded;
}
