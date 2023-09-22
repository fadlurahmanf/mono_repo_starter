import 'package:mapp_storage/src/data/databases/mapp_floor_db.dart';
import 'package:mapp_storage/src/data/datasources/i_mapp_local_datasource.dart';
import 'package:mapp_storage/src/data/entities/mapp_entity_2.dart';

class MappLocalDatasource implements IMappLocalDatasource {
  late MappFloorDb db;

  Future<void> init() async {
    final floor = await $FloorMappFloorDb.databaseBuilder('mapp2.db').build();
    db = floor;
  }

  @override
  Future<void> insertEntity(MappEntity2 entity) async {
    return db.mapDao.insertMappEntity(entity);
  }

  @override
  Future<void> insertEntities(List<MappEntity2> entities) {
    return db.mapDao.insertMappEntities(entities);
  }

  @override
  Future<List<MappEntity2>> getMappEntities() {
    return db.mapDao.getMappEntities();
  }
}
