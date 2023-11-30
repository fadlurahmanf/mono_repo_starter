import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_api/src/data/pagination/base_pagination_response.dart';
import 'package:mapp_api/src/data/pagination/pagination_item_response.dart';

abstract class IOpenviduApi {
  Future<ConnectionResponse> initializeConnection({required String sessionId});
}
