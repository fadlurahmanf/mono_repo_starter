import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappDbCreator extends IDBCreatorRepository {
  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
        databaseName: 'mapp.db',
        version: 1,
      );

  @override
  Map<int, SQLScript> get scripts => {
        1: SQLScript(script: '''CREATE TABLE ${MappEntity.table} ( 
        ${MappEntity.cDeviceId} TEXT PRIMARY KEY,
        ${MappEntity.cGuestToken} TEXT,
        ${MappEntity.cCreatedAt} TEXT,
        ${MappEntity.cLanguageCode} TEXT,
        ${MappEntity.cCountryCode} TEXT,
        )'''),
        2: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cGuestToken} TEXT'''),
        3: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cCreatedAt} TEXT'''),
        4: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cLanguageCode} TEXT'''),
        5: SQLScript(script: '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cCountryCode} TEXT'''),
      };
}
