import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_api/src/data/pagination/base_pagination_response.dart';
import 'package:mapp_api/src/data/pagination/pagination_item_response.dart';

abstract class IPaginationApi {
  Future<BasePaginationResponse<List<PaginationItemResponse>>> getUsers({required int offset, required int limit});
  Future<MappBaseResponse<CtuBasePaginationResponse<List<CtuItemPaginationResponse>>>> getCtuPagination({required int offset});
}
