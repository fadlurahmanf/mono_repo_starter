import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mapp_storage/src/data/databases/mapp_entity_2_dao.dart';
import 'package:mapp_storage/src/data/entities/mapp_entity_2.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'mapp_floor_db.g.dart';

@Database(version: 1, entities: [MappEntity2])
abstract class MappFloorDb extends FloorDatabase {
  MappEntity2Dao get mapDao;
}