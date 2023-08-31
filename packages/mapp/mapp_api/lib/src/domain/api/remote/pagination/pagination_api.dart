import 'package:mapp_api/src/data/pagination/base_pagination_response.dart';
import 'package:mapp_api/src/data/pagination/pagination_item_response.dart';
import 'package:dio/dio.dart';
import 'package:mapp_api/src/domain/common/i_pagination_api.dart';
import 'package:mapp_api/src/external/helper.dart';

class PaginationApi implements IPaginationApi {
  final Dio dio;

  PaginationApi({required this.dio});

  static const String paginationPath = 'v1/sample-data/users';

  @override
  Future<BasePaginationResponse<List<PaginationItemResponse>>> getUsers({required int offset, required int limit}) async {
    await Future.delayed(Duration(seconds: 5));
    return handlePaginationResponse<List<PaginationItemResponse>>(
      onRequest: () async => await dio.get(paginationPath, queryParameters: {
        'offset': offset,
        'limmit': limit,
      }),
      onResponseMap: (iterable) {
        final list = iterable.map((e) => PaginationItemResponse.fromJson((e as Map<String, dynamic>?) ?? {})).toList();
        return list;
      },
    );
  }
}
