import 'package:core/src/dto/entity/core_entity.dart';
import 'package:sqflite/sqflite.dart';

class CoreSqfliteStorage {
  Database db;

  CoreSqfliteStorage({required this.db});

  Future<void> insertOrUpdateIfExist(CoreEntity entity) async {
    final all = await getAll();
    if (all.isNotEmpty) {
      final first = all.first;
      await db.update(CoreEntity.table, first.copyWith(languageCode: entity.languageCode).toJson());
      return;
    }
    await db.insert(CoreEntity.table, entity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CoreEntity>> getAll() async {
    return (await db.query(CoreEntity.table)).map((e) => CoreEntity.fromJson(e)).toList();
  }

  Future<CoreEntity?> getFirstEntity() async {
    final all = await getAll();
    if (all.isEmpty) {
      return null;
    }
    return all.first;
  }
}
