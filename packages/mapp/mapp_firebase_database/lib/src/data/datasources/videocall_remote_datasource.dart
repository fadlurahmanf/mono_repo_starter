import 'package:mapp_firebase_database/src/data/datasources/i_videocall_remote_datasource.dart';
import 'package:firebase_database/firebase_database.dart';

class VideoCallRemoteDataSource implements IVideoCallRemoteDataSource {
  final _videoCallRef = FirebaseDatabase.instance.ref('videocall');
  final _videoCall2Ref = FirebaseDatabase.instance.ref('videocall_2');

  // on key video call
  @override
  DatabaseReference get videoCallRef => _videoCallRef;

  @override
  DatabaseReference get videoCallRoomRef => _videoCallRef.child('rooms');

  @override
  DatabaseReference get videoCall2RoomRef => _videoCall2Ref.child('rooms');
}