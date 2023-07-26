import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappSqfliteDBRepository extends DBRepository {
  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
        databaseName: 'mapp.db',
        version: 3,
      );

  @override
  Map<int, SQLScript> get scripts => {
        1: SQLScript(script: '''CREATE TABLE ${MappEntity.table} ( 
        ${MappEntity.cDeviceId} TEXT PRIMARY KEY
        )'''),
        2: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cGuestToken} TEXT'''),
        3: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cCreatedAt} TEXT'''),
      };
}
