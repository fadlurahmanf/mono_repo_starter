import 'package:core/core.dart';
import 'package:core_sqflite/core_sqflite.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDBRepository {
  SqfliteDBModel get dbModel;

  Map<int, SQLScript> get scripts;

  Future<Database> openDB();

  Future<void> close();

  Future<void> onCreateDB(Database db, int version);

  Future<void> onUpgradeDB(Database db, int oldVersion, int newVersion);
}

abstract class IDBCreatorRepository implements IDBRepository {
  Database? _database;

  @override
  Future<Database> openDB() async {
    _database = await openDatabase(
      '${await getDatabasesPath()}/${dbModel.databaseName}',
      version: dbModel.version,
      onCreate: (db, version) => onCreateDB(db, version),
      onUpgrade: (db, oldVersion, newVersion) => onUpgradeDB(db, oldVersion, newVersion),
    );
    return _database!;
  }

  @override
  Future<void> onCreateDB(Database db, int version) async {
    if (dbModel.version < scripts.length) {
      AppFactory.I.appLogger.w('FORGOT TO INCREASE VERSION DB?', logInAlice: true);
    } else if (dbModel.version > scripts.length) {
      AppFactory.I.appLogger.w('ADD SCRIPT FIRST TO DO A MIGRATION', logInAlice: true);
    } else {
      AppFactory.I.appLogger.d('onCreateDB: $version');
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
      AppFactory.I.appLogger.wtf('NEW VERSION SHOULD BE > OLD VERSION', logInAlice: true);
    } else {
      AppFactory.I.appLogger.d('onUpgradeDB: $oldVersion to $newVersion');
      for (int i = oldVersion + 1; i <= newVersion; i++) {
        final script = scripts[i]?.script;
        if (script != null) {
          batch.execute(scripts[i]!.script);
        }
      }
      await batch.commit();
    }
  }

  @override
  Future<void> close() async {
    if (_database != null) {
      return _database?.close();
    }
  }
}
