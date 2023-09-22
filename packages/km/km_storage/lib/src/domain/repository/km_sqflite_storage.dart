import 'package:km_storage/km_storage.dart';
import 'package:sqflite/sqflite.dart';

class KmSqfliteStorage {
  Database db;

  KmSqfliteStorage({required this.db});

  Future<int> insert({required KmEntity mappEntity}) async {
    await db.delete(KmEntity.table);
    return db.insert(KmEntity.table, mappEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<KmEntity>> getAll() async {
    final lMap = await db.query(KmEntity.table);
    return lMap.map((e) => KmEntity.fromJson(e)).toList();
  }

  Future<KmEntity?> getData() async {
    final lMap = await getAll();
    if (lMap.isNotEmpty) {
      return lMap.first;
    }
    return null;
  }
}
