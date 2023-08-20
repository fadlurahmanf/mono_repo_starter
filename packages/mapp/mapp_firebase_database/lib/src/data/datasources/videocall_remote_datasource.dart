import 'package:mapp_firebase_database/src/data/datasources/i_videocall_remote_datasource.dart';
import 'package:firebase_database/firebase_database.dart';

class VideoCallRemoteDataSource implements IVideoCallRemoteDataSource {
  final _videoCallRef = FirebaseDatabase.instance.ref('videocall');

  // on key video call
  @override
  DatabaseReference get videoCallReference => _videoCallRef;
}