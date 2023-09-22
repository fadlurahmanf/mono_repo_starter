import 'dart:math';

import 'package:mapp_api/mapp_api.dart';
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
  Future<BasePaginationResponse<List<PaginationItemResponse>>> getUsers(
      {required int offset, required int limit}) async {
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

  String getRandomStatus(int number) {
    if (number % 2 == 0) {
      return 'TRANSFERRED';
    } else {
      return 'CANCELLED';
    }
  }

  @override
  Future<MappBaseResponse<CtuBasePaginationResponse<List<CtuItemPaginationResponse>>>> getCtuPagination({
    required int offset,
  }) async {
    await Future.delayed(Duration(seconds: 3));
    List<CtuItemPaginationResponse> items = [];
    if (offset == 0) {
      items.addAll(List.generate(
          Random().nextInt(10),
          (index) => CtuItemPaginationResponse(
                id: Random().nextInt(100).toString(),
                status: getRandomStatus(Random().nextInt(100)),
                label: 'INI STATUS RANDOM AJA',
                createdAt: DateTime.now().toIso8601String(),
              )));
      items.addAll(List.generate(
          Random().nextInt(10),
          (index) => CtuItemPaginationResponse(
                id: Random().nextInt(100).toString(),
                status: getRandomStatus(Random().nextInt(100)),
                label: 'INI STATUS RANDOM AJA',
                createdAt: DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
              )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 4)).toIso8601String(),
          )));
    }else if(offset == 1){
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 6)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
          )));
    }else if(offset == 2){
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 8)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 11)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 13)).toIso8601String(),
          )));
    }else if(offset == 3){
      items.addAll(List.generate(
          Random().nextInt(2),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 14)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(1),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(3),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 17)).toIso8601String(),
          )));
    }else if(offset == 4){
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 19)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 20)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 22)).toIso8601String(),
          )));
    }else if(offset == 5){
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 22)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 23)).toIso8601String(),
          )));
      items.addAll(List.generate(
          Random().nextInt(10),
              (index) => CtuItemPaginationResponse(
            id: Random().nextInt(100).toString(),
            status: getRandomStatus(Random().nextInt(100)),
            label: 'INI STATUS RANDOM AJA',
            createdAt: DateTime.now().subtract(const Duration(days: 24)).toIso8601String(),
          )));
    }
    return MappBaseResponse(
        status: true,
        message: 'SUCCESS',
        data: CtuBasePaginationResponse<List<CtuItemPaginationResponse>>(
            totalPages: 5,
            totalItems: 100,
            next: offset < 5,
            content: items,
        ));
    // return MappBaseResponse(
    //     status: true,
    //     message: 'SUCCESS',
    //     data: CtuBasePaginationResponse<List<CtuItemPaginationResponse>>(
    //         totalPages: 5,
    //         totalItems: 100,
    //         next: offset < 5,
    //         content: List.generate(
    //             10,
    //             (index) => CtuItemPaginationResponse(
    //                   id: Random().nextInt(100).toString(),
    //                   status: getRandomStatus(Random().nextInt(100)),
    //                   label: 'INI STATUS RANDOM AJA',
    //                   createdAt: DateTime.now()
    //                       .subtract(Duration(days: (5 * offset) + Random().nextInt((offset + 1) * 5)))
    //                       .toString(),
    //                 ))));
  }
}
