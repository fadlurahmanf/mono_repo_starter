import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:mapp_api/mapp_api.dart';
import 'package:mapp_example/src/domain/repositories/i_pagination_repository.dart';

class PaginationRepository implements IPaginationRepository {
  IPaginationApi paginationApi;

  PaginationRepository({required this.paginationApi});

  @override
  Future<Either<Exception, BasePaginationResponse<List<PaginationItemResponse>>>> getUsers(
      {required int offset, required int limit}) async {
    try {
      final res = await paginationApi.getUsers(offset: offset, limit: limit);
      return right(res);
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, CtuBasePaginationResponse<List<CtuItemPaginationResponse>>>> ctuGetPagination({
    required int offset,
  }) async {
    try {
      final res = await paginationApi.getCtuPagination(offset: offset);
      if (res.data != null) {
        return right(res.data!);
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      return left(e);
    }
  }
}
