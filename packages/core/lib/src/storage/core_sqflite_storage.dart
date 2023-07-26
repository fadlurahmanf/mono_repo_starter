import 'package:core/src/dto/entity/core_entity.dart';
import 'package:sqflite/sqflite.dart';

class CoreSqfliteStorage {
  Database database;

  CoreSqfliteStorage({required this.database});

  Future<void> insertOrUpdateIfExist(CoreEntity entity) async {
    final all = await getAll();
    if (all.isNotEmpty) {
      final first = all.first;
      await database.update(CoreEntity.table, first.copyWith(languageCode: entity.languageCode).toJson());
      return;
    }
    await database.insert(CoreEntity.table, entity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CoreEntity>> getAll() async {
    return (await database.query(CoreEntity.table)).map((e) => CoreEntity.fromJson(e)).toList();
  }

  Future<CoreEntity?> getFirstEntity() async {
    final all = await getAll();
    if (all.isEmpty) {
      return null;
    }
    return all.first;
  }
}
