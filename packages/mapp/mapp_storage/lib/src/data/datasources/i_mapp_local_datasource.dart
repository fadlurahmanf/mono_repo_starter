import 'package:mapp_storage/src/data/entities/mapp_entity_2.dart';

abstract class IMappLocalDatasource {
  Future<void> insertEntity(MappEntity2 entity);
  Future<void> insertEntities(List<MappEntity2> entities);
  Future<List<MappEntity2>> getMappEntities();
}
