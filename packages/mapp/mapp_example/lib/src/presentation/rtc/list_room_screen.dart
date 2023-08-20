import 'package:flutter/material.dart';
import 'package:core_config/config.dart';
import 'package:mapp_firebase_database/mapp_firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

class ListRoomScreen extends StatefulWidget with WrapperState {
  const ListRoomScreen({super.key});

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Stream<DatabaseEvent>? roomSubscription;
  List<DataSnapshot> listRoom = [];

  Future<void> init() async {
    if (mounted) {
      roomSubscription = context.get<IVideoCallRemoteDataSource>().videoCallRoomRef.onValue;
      roomSubscription?.listen((event) {
        setState(() {
          listRoom = event.snapshot.children.toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('List Room RTC'),
        actions: [
          GestureDetector(
            onTap: () async {
              context.pushNamed('MappExampleRoute', 'CallerScreen', arguments: {
                'isCaller': true,
              });
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listRoom.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${listRoom[index].key}'),
            onTap: () async {
              context.pushNamed('MappExampleRoute', 'CallerScreen', arguments: {
                'isCaller': false,
                'roomId': listRoom[index].key,
              });
            },
          );
        },
      ),
    );
  }
}
