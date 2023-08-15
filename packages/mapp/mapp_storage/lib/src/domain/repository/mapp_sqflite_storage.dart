import 'package:mapp_storage/mapp_storage.dart';
import 'package:mapp_storage/src/domain/common/i_mapp_sqflite_storage.dart';
import 'package:sqflite/sqflite.dart';

class MappSqfliteStorage implements IMappSqfliteStorage {
  Database db;

  MappSqfliteStorage({required this.db});

  @override
  Future<int> removeDataAndInsert(MappEntity entity) async {
    await db.delete(MappEntity.table);
    return db.insert(MappEntity.table, entity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<MappEntity>> getAll() async {
    final lMap = await db.query(MappEntity.table);
    return lMap.map((e) => MappEntity.fromJson(e)).toList();
  }

  @override
  Future<MappEntity> getData() async {
    final lMap = await getAll();
    return lMap.first;
  }

  @override
  Future<MappEntity?> getDataOrNull() async {
    final lMap = await getAll();
    if (lMap.isNotEmpty) {
      return lMap.first;
    } else {
      return null;
    }
  }

  @override
  Future<int> updateGuestToken(String guestToken) async {
    final data = await getDataOrNull();
    if (data != null) {
      return db.update(MappEntity.table, data.copyWith(guestToken: guestToken).toJson());
    } else {
      return -1;
    }
  }

  @override
  Future<int> updateLocale({String? languageCode, String? countryCode}) async {
    final data = await getDataOrNull();
    if (data != null) {
      return db.update(MappEntity.table, data.copyWith(languageCode: languageCode, countryCode: countryCode).toJson());
    } else {
      return -1;
    }
  }

  @override
  Future<int> updateByMap(MappEntity entity) async {
    final data = await getDataOrNull();
    if (data != null) {
      return db.update(MappEntity.table, entity.toJson());
    } else {
      return -1;
    }
  }

  @override
  Future<int> updateDeviceId(String deviceId) async {
    final data = await getDataOrNull();
    if (data != null) {
      return db.update(MappEntity.table, data.copyWith(deviceId: deviceId).toJson());
    } else {
      return -1;
    }
  }
}
