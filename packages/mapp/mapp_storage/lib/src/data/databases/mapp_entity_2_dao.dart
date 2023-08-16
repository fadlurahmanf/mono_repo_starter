import 'package:mapp_storage/src/data/entities/mapp_entity_2.dart';
import 'package:core_floor/floor.dart';
import 'package:floor_annotation/floor_annotation.dart';

@dao
abstract class MappEntity2Dao extends CoreDao {
  static const String tableName = 'MappEntity2';

  @insert
  Future<List<int>> insertMappEntities(List<MappEntity2> entities);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMappEntity(MappEntity2 entity);

  @Query('SELECT * FROM $tableName')
  Future<List<MappEntity2>> getMappEntities();
}
