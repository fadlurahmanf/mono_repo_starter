import 'package:mapp_firebase_database/src/data/datasources/i_videocall_remote_datasource.dart';
import 'package:firebase_database/firebase_database.dart';

class VideoCallRemoteDataSource implements IVideoCallRemoteDataSource {
  final _videoCallRef = FirebaseDatabase.instance.ref('videocall');

  // on key video call
  @override
  DatabaseReference get videoCallReference => _videoCallRef;

  @override
  DatabaseReference get callerDb => _videoCallRef.child('caller');

  @override
  Stream<DatabaseEvent> get onKCallerChildChanged => _videoCallRef.child('caller').onChildChanged;

  @override
  Stream<DatabaseEvent> get onKReceiverChildAdded => _videoCallRef.child('receiver').onChildAdded;
}