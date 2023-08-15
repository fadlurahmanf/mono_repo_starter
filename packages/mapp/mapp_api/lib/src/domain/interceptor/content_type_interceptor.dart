import 'package:dio/dio.dart';

class ContentTypeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['content-type'] = 'application/json';
    super.onRequest(options, handler);
  }
}
