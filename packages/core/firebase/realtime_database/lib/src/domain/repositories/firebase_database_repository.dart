import 'package:core_firebase_database/src/domain/repositories/i_firebase_database_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseRepository implements IFirebaseDatabaseRepository {
  final instance = FirebaseDatabase.instance;
}
