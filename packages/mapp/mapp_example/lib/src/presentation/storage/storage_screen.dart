import 'package:flutter/material.dart';
import 'package:core_config/config.dart';
import 'package:mapp_storage/mapp_storage.dart';

class StorageScreen extends StatefulWidget with WrapperState {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();

  @override
  Widget wrap(BuildContext context) {
    return this;
  }
}

class _StorageScreenState extends State<StorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final insert = await context.get<IMappLocalDatasource>().insertEntity(MappEntity2(deviceId: 'deviceId'));
                print("SUCCESS INSERT");
              },
              child: Text('INSERT 1 DATA'),
            ),
            ElevatedButton(
              onPressed: () async {
                final entities = await context.get<IMappLocalDatasource>().getMappEntities();
                print("SUCCESS entities: ${entities.length}");
                entities.forEach((element) {
                  print("MASUK EL: ${element.toJson()}");
                });
              },
              child: Text('GET ENTITIES'),
            ),
          ],
        ),
      ),
    );
  }
}
