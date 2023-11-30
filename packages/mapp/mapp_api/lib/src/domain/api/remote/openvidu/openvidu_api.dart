import 'dart:convert';

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
    return handleViduResponse<ConnectionResponse>(
        onRequest: () async => dio.post('openvidu/api/sessions/$sessionId/connection',
            data: const ConnectionRequest(
              type: 'WEBRTC',
              record: false,
              role: 'PUBLISHER',
            ),
            options: Options(
              headers: {
                'Authorization': 'Basic ${base64Encode(utf8.encode('OPENVIDUAPP:QkFOS01BUzIwMjIK'))}',
                'content-type': 'application/json',
              },
            )),
        onResponseMap: (resp) => ConnectionResponse.fromJson(resp));
  }
}
