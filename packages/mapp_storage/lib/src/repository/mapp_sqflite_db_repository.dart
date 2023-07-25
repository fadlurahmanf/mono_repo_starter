import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/mapp_storage.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:core/core.dart';

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

  @override
  Future<void> onCreateDB(Database db, int version) async {
    if (dbModel.version < scripts.length) {
      AppUtility.appLogger.w('FORGOT TO INCREASE VERSION DB?', logInAlice: true);
    } else if (dbModel.version > scripts.length) {
      AppUtility.appLogger.w('ADD SCRIPT FIRST TO DO A MIGRATION', logInAlice: true);
    } else {
      AppUtility.appLogger.d('onCreateDB: $version');
      final batch = db.batch();
      for (int i = 1; i <= scripts.length; i++) {
        final script = scripts[i]?.script;
        if (script != null) {
          batch.execute(scripts[i]!.script);
        }
      }
      await batch.commit();
    }
  }

  @override
  Future<void> onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    final batch = db.batch();
    if (newVersion <= oldVersion) {
      AppUtility.appLogger.wtf('NEW VERSION SHOULD BE > OLD VERSION', logInAlice: true);
    } else {
      AppUtility.appLogger.d('onUpgradeDB: $oldVersion to $newVersion');
      for (int i = oldVersion + 1; i <= newVersion; i++) {
        final script = scripts[i]?.script;
        if (script != null) {
          batch.execute(scripts[i]!.script);
        }
      }
      await batch.commit();
    }
  }
}
