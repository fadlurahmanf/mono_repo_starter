import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/mapp_storage.dart';

class MappDbCreator extends DBCreatorRepository {
  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
        databaseName: 'mapp.db',
        version: 4,
      );

  @override
  Map<int, SQLScript> get script => {
        1: SQLScript(scripts: [
          '''CREATE TABLE ${MappEntity.table} ( 
        ${MappEntity.cDeviceId} TEXT PRIMARY KEY
        )''',
        ]),
        2: SQLScript(scripts: ['''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cGuestToken} TEXT''']),
        3: SQLScript(scripts: ['''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cCreatedAt} TEXT''']),
        4: SQLScript(
          scripts: [
            '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cLanguageCode} TEXT''',
            '''ALTER TABLE ${MappEntity.table} ADD ${MappEntity.cCountryCode} TEXT''',
          ],
        ),
      };
}
