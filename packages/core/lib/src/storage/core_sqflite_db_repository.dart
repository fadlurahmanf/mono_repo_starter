import 'package:core/src/dto/entity/core_entity.dart';
import 'package:core_sqflite/core_sqflite.dart';

class CoreSqfliteDBRepository extends DBRepository {

  @override
  SqfliteDBModel get dbModel => SqfliteDBModel(
      databaseName: 'core.db',
      version: 1,
  );

  @override
  Map<int, SQLScript> get scripts => {
    1: SQLScript(script: '''CREATE TABLE ${CoreEntity.table} (${CoreEntity.cLanguageCode} TEXT)'''),
  };

}