import 'package:mapp_storage/mapp_storage.dart';

abstract class IMappSqfliteStorage {
  Future<int> removeDataAndInsert(MappEntity entity);

  Future<List<MappEntity>> getAll();

  Future<MappEntity> getData();

  Future<MappEntity?> getDataOrNull();

  Future<int> updateGuestToken(String guestToken);

  Future<int> updateLocale({required String languageCode, required String countryCode});

  Future<int> updateDeviceId(String deviceId);

  Future<int> updateByMap(MappEntity entity);
}
