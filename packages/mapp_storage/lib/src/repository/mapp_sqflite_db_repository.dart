import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MappSqfliteDBRepository extends DBRepository {
  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
      databaseName: 'mapp.db',
      version: 1,
  );

  @override
  Future<void> onCreateDB(Database db, int version) async {
    final batch = db.batch();
    batch.execute('''CREATE TABLE ${MappEntity.table} ( 
        ${MappEntity.cDeviceId} TEXT PRIMARY KEY
        )''');
    await batch.commit();
  }

  @override
  Future<void> onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    print("masuk upgrade: $oldVersion & $newVersion");
  }
}