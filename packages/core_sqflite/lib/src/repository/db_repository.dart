import 'package:core_sqflite/core_sqflite.dart';
import 'package:core_sqflite/src/dto/model/sql_script.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDBRepository {
  SqfliteDBModel get dbModel;
  Map<int, SQLScript> get scripts;

  Future<Database> openDB();

  Future<void> close();

  Future<void> onCreateDB(Database db, int version);

  Future<void> onUpgradeDB(Database db, int oldVersion, int newVersion);
}

abstract class DBRepository implements IDBRepository {
  Database? _database;

  @override
  Future<Database> openDB() async {
    _database = await openDatabase('${await getDatabasesPath()}/${dbModel.databaseName}',
        version: dbModel.version,
        onCreate: (db, version) => onCreateDB(db, version),
        onUpgrade: (db, oldVersion, newVersion) => onUpgradeDB(db, oldVersion, newVersion),
    );
    return _database!;
  }

  @override
  Future<void> close() async {
    if (_database != null) {
      return _database?.close();
    }
  }
}
