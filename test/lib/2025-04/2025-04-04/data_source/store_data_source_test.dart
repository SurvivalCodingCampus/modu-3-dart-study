import 'dart:convert';
import 'dart:io';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/store_dto.dart'
    show StoreDto;
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  final http.Client mockClient = MockClient((request) async {
    final String json = jsonEncode({
      "stores": [
        {
          "addr": "서울특별시 강북구 솔매로 38 (미아동)",
          "code": "11817488",
          "created_at": "2020/07/03 11:00:00",
          "lat": 37.6254369,
          "lng": 127.0164096,
          "name": "승약국",
          "remain_stat": "plenty",
          "stock_at": "2020/07/02 18:05:00",
          "type": "01",
        },
      ],
    });

    return http.Response(
      json,
      200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );
  });

  final StoreDataSource dataSource = HttpStoreDataSource(mockClient);

  test('fetchStore() 호출 시 List<StoreDto>를 반환해야한다.', () async {
    final List<StoreDto> stores = await dataSource.fetchStore();

    expect(stores, isNotEmpty);
    expect(stores[0].name, equals('승약국'));
  });

  test(
    'fetchStore() 호출 시 remainStat, stockAt, createdAt이 빈 StoreDto는 없어야한다.',
    () async {
      final List<StoreDto> stores = await dataSource.fetchStore();

      List<StoreDto> none =
          stores
              .where(
                (e) =>
                    e.remainStatus == null &&
                    e.stockAt == null &&
                    e.createdAt == null,
              )
              .toList();

      expect(stores, isNotEmpty);
      expect(none, isEmpty);
    },
  );
}
