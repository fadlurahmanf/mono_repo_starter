import 'package:firebase_database/firebase_database.dart';

abstract class IVideoCallRemoteDataSource {
  // on key video call
  DatabaseReference get videoCallReference;
}