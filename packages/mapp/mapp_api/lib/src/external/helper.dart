import 'package:dio/dio.dart';
import 'package:mapp_api/src/data/general/mapp_base_response.dart';
import 'package:mapp_api/src/data/pagination/base_pagination_response.dart';
import 'package:mapp_shared/src/data/exception/mapp_response_exception.dart';

Future<T> handleResponse<T>({
  required Future<Response<dynamic>> Function() onRequest,
  required T Function(Map<String, dynamic>) onResponseMap,
}) async {
  try {
    final request = await onRequest();
    final response =
        MappBaseResponse<T>.fromJson(request.data, (json) => onResponseMap((json as Map<String, dynamic>?) ?? {}));
    if (response.data != null && response.message == 'SUCCESS') {
      return Future.value(response.data!);
    } else {
      throw MappResponseException();
    }
  } on DioException catch (e) {
    throw Exception();
  } on Exception catch (e) {
    throw Exception();
  }
}

Future<BasePaginationResponse<T>> handlePaginationResponse<T>({
  required Future<Response<dynamic>> Function() onRequest,
  required T Function(Iterable) onResponseMap,
}) async {
  try {
    final request = await onRequest();
    final response =
        BasePaginationResponse<T>.fromJson(request.data, (json) => onResponseMap((json as Iterable?) ?? []));
    return response;
  } on DioException catch (e) {
    throw Exception();
  } on Exception catch (e) {
    throw Exception();
  }
}
