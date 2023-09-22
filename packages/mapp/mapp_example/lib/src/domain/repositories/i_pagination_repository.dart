import 'package:dartz/dartz.dart';
import 'package:mapp_api/mapp_api.dart';

abstract class IPaginationRepository {
  Future<Either<Exception, BasePaginationResponse<List<PaginationItemResponse>>>> getUsers({required int offset, required int limit});
  Future<Either<Exception, CtuBasePaginationResponse<List<CtuItemPaginationResponse>>>> ctuGetPagination({required int offset});
}