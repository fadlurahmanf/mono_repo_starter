import 'dart:math';

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

  List<DataSnapshot> listRoom = [];

  Future<void> init() async {
    if (mounted) {
      final list = (await context.get<IVideoCallRemoteDataSource>().videoCall2RoomRef.get());
      listRoom = list.children.toList();
      setState(() {});
      print("MASUK ${list.children}");
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
              // context.pushNamed('MappExampleRoute', 'CallerScreen', arguments: {
              //   'isCaller': true,
              // });
              context.pushNamed('MappExampleRoute', 'ManualCallScreen', arguments: {
                'isCaller': true,
                'roomId': generateRoomId(),
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
              context.pushNamed('MappExampleRoute', 'ManualCallScreen', arguments: {
                'roomId': listRoom[index].key,
              });
              // context.pushNamed('MappExampleRoute', 'CallerScreen', arguments: {
              //   'isCaller': false,
              //   'roomId': listRoom[index].key,
              // });
            },
          );
        },
      ),
    );
  }

  String generateRoomId() {
    const char = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        15,
        (_) => char.codeUnitAt(Random().nextInt(char.length)),
      ),
    );
  }
}
