import 'package:mapp_storage/mapp_storage.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<MappEntity?> getData() async {
    final lMap = await getAll();
    if (lMap.isNotEmpty) {
      return lMap.first;
    }
    return null;
  }
}
