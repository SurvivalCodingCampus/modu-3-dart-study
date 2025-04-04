import 'dart:convert';
import 'dart:io';

import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/http_inventory_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/inventory_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/inventory_dto.dart';
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

  final InventoryDataSource dataSource = HttpInventoryDataSource(mockClient);

  test('fetchInventoryItems() 호출 시 List<InventoryDto>를 반환해야한다.', () async {
    final List<InventoryDto> inventories = await dataSource.fetchInventories();

    expect(inventories, isNotEmpty);
    expect(inventories[0].name, equals('승약국'));
  });

  test(
    'fetchInventoryItems() 호출 시 remainStat, stockAt, createdAt이 빈 InventoryDto는 없어야한다.',
    () async {
      final List<InventoryDto> inventories =
          await dataSource.fetchInventories();

      List<InventoryDto> none =
          inventories
              .where(
                (e) =>
                    e.remainStatus == null &&
                    e.stockAt == null &&
                    e.createdAt == null,
              )
              .toList();

      expect(inventories, isNotEmpty);
      expect(none, isEmpty);
    },
  );
}
