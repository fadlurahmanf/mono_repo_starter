import 'package:mapp_api/src/mapp_api_module.dart';
import 'package:dio/dio.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MappApiDevModule extends MappApiModule {
  MappApiDevModule({required super.settings});

  @override
  Dio abstractDio(BaseOptions options, {required List<Interceptor> interceptors}) {
    return super.abstractDio(options, interceptors: [
      CurlLoggerDioInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    ]);
  }
}
