import 'package:core_sqflite/core_sqflite.dart';
import 'package:mapp_storage/src/model/entity/_index.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MappSqfliteRepository {
  Database db;

  MappSqfliteRepository({required this.db});

  Future<int> insert({required MappEntity mappEntity}) async {
    await db.delete(MappEntity.table);
    return db.insert(MappEntity.table, mappEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MappEntity>> getAll() async {
    final lMap = await db.query(MappEntity.table);
    return lMap.map((e) => MappEntity.fromJson(e)).toList();
  }
}
