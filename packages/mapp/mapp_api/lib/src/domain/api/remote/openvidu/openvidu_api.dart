import 'package:dio/dio.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_api/src/data/openvidu/connection_response.dart';
import 'package:mapp_api/src/domain/common/i_openvidu_api.dart';
import 'package:mapp_api/src/external/helper.dart';

class OpenviduApi implements IOpenviduApi {
  final Dio dio;

  OpenviduApi({required this.dio});

  static const String initializeConnectionPath = 'sessions/{id}/connection';

  @override
  Future<ConnectionResponse> initializeConnection({required String sessionId}) async {
    return handleResponse<ConnectionResponse>(
        onRequest: () async => dio.post('sessions/$sessionId/connection',
            data: const ConnectionRequest(
              type: 'WEBRTC',
              record: false,
              role: 'PUBLISHER',
            )),
        onResponseMap: (resp) => ConnectionResponse.fromJson(resp));
  }
}
