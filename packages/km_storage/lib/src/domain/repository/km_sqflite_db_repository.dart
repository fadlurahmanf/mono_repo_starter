import 'package:core_sqflite/core_sqflite.dart';
import 'package:km_storage/km_storage.dart';

class KmSqfliteDBRepository extends IDBCreatorRepository {
  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
        databaseName: 'km.db',
        version: 1,
      );

  @override
  Map<int, SQLScript> get scripts => {
        1: SQLScript(script: '''CREATE TABLE ${KmEntity.table} ( 
        ${KmEntity.cDeviceId} TEXT PRIMARY KEY,
        ${KmEntity.cCreatedAt} TEXT
        )'''),
      };
}
